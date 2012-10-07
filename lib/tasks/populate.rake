namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke

    100.times do
      user = User.new
      user.first_name = Faker::Name.first_name
      user.last_name = Faker::Name.first_name
      user.password = "lattis"

      user.email =
        "#{user.first_name.downcase}.#{user.last_name.downcase}@lattis.app"
      user.save
    end

    100.times do
      Subject.create(
        :first_name => Faker::Name.first_name,
        :last_name => Faker::Name.last_name,
        :email => Faker::Internet.email,
        :phone => [Faker::PhoneNumber.phone_number, nil].sample,
        :secondary_phone => [Faker::PhoneNumber.phone_number, nil].sample,
        :address => [Faker::Address.street_address, nil].sample,
        :address2 => [Faker::Address.secondary_address, nil].sample,
        :city => [Faker::Address.city, nil].sample,

        :state => [Faker::Address.state, nil].sample,

        :zipcode => [Faker::Address.zip_code[0..7],
                     Faker::Address.zip_code,
                     nil].sample,

        :mrn => (1..9).to_a.shuffle.join[0..6],
        :date_of_birth => Time.now - ((18..36).to_a.sample).years,
        :handedness => ["right", "left", "ambidextrous"].sample,
        :gender => ['male','female'].sample,
        :ethnicity_id => Ethnicity.all.sample.id,
        :race_id => Race.all.sample.id,
        :height => (48..70).to_a.sample,
        :weight => (100..300).to_a.sample
      )
    end

    #Assign Subjects to Populations
    Subject.all.each do |subject|
      rand(4 + 1).times do
        subject.populations << Population.all.sample
      end
    end

    #Create Fake Studies
    4.times do
      Study.create(
        :name => Faker::Lorem.words(2).join,
        :irb_number => "2012P-" + (1..6).to_a.shuffle.join,
        :description => [Faker::Lorem.paragraph(3), nil].sample
      )
    end

    #Assign Subjects to Studies
    Subject.all.each do |subject|
      (rand(3 + 1)).times do
        subject.enrollments.create(
          :study_id => Study.all.sample.id,
          :user_id => [User.all.sample.id, nil].sample
        )
      end
    end

    #Assign User to Studies
    User.all.each do |user|
      (rand(3 + 1)).times do
        user.study_staff.create(
          :study_id => Study.all.sample.id,
          :user_id => [User.all.sample.id, nil].sample,
          :is_principle => [true, false].sample
        )
      end
    end

    #Create Fake Visits
    60.times do
      Visit.create(
        :subject_id => Subject.all.sample.id,
        :study_id => Study.all.sample.id,
        :date => Date.today - (rand(500 + 1)).days
      )
    end

    #Create Fake Stimulation Sessions
    30.times do
      visit = Visit.all.sample

      StimulationSession.create(
       :visit_id => visit.id,
       :subject_id => visit.subject_id,
       :location_id => Location.all.sample.id,
       :study_id => visit.id,
       :user_id => User.all.sample.id,
       :neuro_navigation_used => [true, false].sample,
       :date => visit.date,
       :cnbs_staff_used => [true, false].sample)
    end

    #Create Fake Stimulation Device Sessions
    StimulationSession.all.each do |stimulation_session|
      (rand(5) + 1).times do
        stimulator_model = StimulatorModel.all.sample
        stimulator = stimulator_model.stimulators.sample
        StimulationDeviceSession.create(
          :stimulation_session_id => stimulation_session.id,
          :subject_id => stimulation_session.subject_id,
          :user_id => stimulation_session.user_id,
          :study_id => stimulation_session.study_id,
          :stimulator_model_id => StimulatorModel.all.sample.id,
          :stimulator_id => Stimulator.all.sample.id,
          :coil_id => Coil.all.sample.id,
          :date => stimulation_session.date
        )
      end

      (rand(3) + 1).times do
        MotorThreshold.create(
          :variety => ['active', 'resting'].sample,
          :determination => ['visual', 'EMG'].sample,
          :stimulation_session_id => stimulation_session.id,
          :stimulator_id => Stimulator.all.sample.id,
          :coil_id => Coil.all.sample.id,
          :date => stimulation_session.date
        )
      end

    end

    #Create Fake Stimulations
    StimulationDeviceSession.all.each do |stimulation_device_session|
     (rand(50) + 1).times do
        stimulation_type = StimulationType.all.sample

        stimulation_sub_type = unless stimulation_type.stimulation_sub_types.empty?
          stimulation_type.stimulation_sub_types.all.sample
        else
          nil
        end

        stimulation_sub_type_id =
          stimulation_sub_type ? stimulation_sub_type.id : nil

        stimulation_sub_sub_type = unless stimulation_sub_type.nil?
          unless stimulation_sub_type.stimulation_sub_sub_types.empty?
            stimulation_sub_type.stimulation_sub_sub_types.all.sample
          else
            nil
          end
        else
          nil
        end

        stimulation_sub_sub_type_id =
          stimulation_sub_sub_type ? stimulation_sub_sub_type.id : nil

        stimulation_session = stimulation_device_session.stimulation_session

        stimulation = Stimulation.create(
          :date => stimulation_device_session.date,
          :stimulation_type_id => stimulation_type.id,
          :stimulation_sub_type_id => stimulation_sub_type_id,
          :stimulation_sub_sub_type_id => stimulation_sub_sub_type_id,
          :stimulation_session_id => stimulation_session.id,
          :stimulation_device_session_id => stimulation_device_session.id,
          :study_id => stimulation_session.id,
          :subject_id => stimulation_device_session.subject_id,
          :sham => [true, false].sample,
          :brain_area_id => BrainArea.all.sample.id,
          :intensity => ((0..100).to_a.sample) * 0.01,
          :duration => (40..3600).to_a.sample
        )

        (rand(3 + 1)).times do
          stimulation.tasks.create(
            :task_type_id => TaskType.all.sample.id,
            :subject_id => stimulation_device_session.subject_id,
            :visit_id => stimulation_session.visit_id
          )
        end

      end

    end

    #Create Fake Scan Sessions
    30.times do
      visit = Visit.all.sample

      ScanSession.create(
       :visit_id => visit.id,
       :subject_id => visit.subject_id,
       :location_id => Location.all.sample.id,
       :study_id => Study.all.sample.id,
       :user_id => User.all.sample.id,
       :date => visit.date)
    end

    #Create Fake Scans
    ScanSession.all.each do |scan_session|
      (rand(50) + 1).times do
        scan_type = ScanType.all.sample

        scan_sub_type = unless scan_type.scan_sub_types.empty?
          scan_type.scan_sub_types.all.sample
        else
          nil
        end

        scan_sub_type_id =
          scan_sub_type ? scan_sub_type.id : nil

        scan = Scan.create(
          :subject_id => scan_session.subject.id,
          :visit_id => scan_session.visit.id,
          :study_id => scan_session.study.id,
          :user_id => scan_session.staff.id,
          :scan_type_id => scan_type.id,
          :scan_sub_type_id => scan_sub_type_id,
          :scan_format_id => ScanFormat.all.sample.id,
          :file => Faker::Lorem.words.join,
          :scan_session_id => scan_session,
          :date => scan_session.date
        )

        (rand(3 + 1)).times do
          scan.tasks.create(
            :task_type_id => TaskType.all.sample.id,
            :subject_id => scan_session.subject_id,
            :visit_id => scan_session.visit_id
          )
        end
      end
    end


    #Create Fake Exams
    60.times do
      pregnancy_start_time = Time.now - (rand(5000 + 1)).hours
      visit = Visit.all.sample

      Exam.create(
        :date => Date.today - (rand(500 + 1)).days,
        :pregnancy_test_start_time => pregnancy_start_time,
        :pregnancy_test_end_time => pregnancy_start_time + 3.minutes,
        :visit_id => visit.id,
        :subject_id => visit.subject.id,
        :pregnant => [true,false].sample,
        :user_id => User.all.sample.id,
        :pregnancy_test_lot => (0..6).to_a.shuffle.join,
        :study_id => visit.study.id
      )
    end
  end
end
