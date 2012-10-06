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
  end
end
