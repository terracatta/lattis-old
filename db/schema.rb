# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121007060644) do

  create_table "brain_areas", :force => true do |t|
    t.string   "name"
    t.string   "short_name"
    t.string   "hemisphere"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "device_models", :force => true do |t|
    t.string   "name"
    t.string   "type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "devices", :force => true do |t|
    t.string   "name"
    t.string   "type"
    t.string   "serial"
    t.integer  "device_model_id"
    t.integer  "stimulator_id"
    t.integer  "coil_id"
    t.integer  "stimulator_model_id"
    t.integer  "coil_model_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "enrollments", :force => true do |t|
    t.integer  "study_id"
    t.integer  "user_id"
    t.integer  "subject_id"
    t.integer  "visit_id"
    t.date     "enrollment_start_date"
    t.date     "enrollment_end_date"
    t.string   "enrollment_status"
    t.text     "enrollment_status_comment"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "ethnicities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "exams", :force => true do |t|
    t.integer  "visit_id"
    t.integer  "subject_id"
    t.boolean  "pregnant"
    t.integer  "user_id"
    t.string   "pregnancy_test_lot"
    t.integer  "study_id"
    t.datetime "pregnancy_test_start_time"
    t.datetime "pregnancy_test_end_time"
    t.date     "date"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.string   "building_name"
    t.string   "floor_number"
    t.string   "room_number"
    t.string   "key_number"
    t.string   "phone"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "motor_thresholds", :force => true do |t|
    t.string   "variety"
    t.integer  "stimulator_id"
    t.integer  "coil_id"
    t.float    "intensity"
    t.string   "determination"
    t.integer  "stimulation_session_id"
    t.datetime "date"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "population_rosters", :force => true do |t|
    t.integer  "subject_id"
    t.integer  "population_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "populations", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "races", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "scan_formats", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "scan_sessions", :force => true do |t|
    t.integer  "visit_id"
    t.integer  "user_id"
    t.integer  "subject_id"
    t.integer  "location_id"
    t.integer  "study_id"
    t.datetime "date"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "scan_sub_types", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "scan_type_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "scan_types", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "scans", :force => true do |t|
    t.integer  "visit_id"
    t.integer  "location_id"
    t.integer  "study_id"
    t.integer  "subject_id"
    t.integer  "scan_session_id"
    t.integer  "user_id"
    t.integer  "scan_type_id"
    t.integer  "scan_sub_type_id"
    t.integer  "scan_format_id"
    t.datetime "date"
    t.string   "file"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "stimulation_device_sessions", :force => true do |t|
    t.integer  "stimulation_session_id"
    t.integer  "stimulator_id"
    t.integer  "stimulator_model_id"
    t.integer  "coil_id"
    t.integer  "coil_model_id"
    t.integer  "subject_id"
    t.integer  "study_id"
    t.integer  "user_id"
    t.datetime "date"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "stimulation_sessions", :force => true do |t|
    t.integer  "visit_id"
    t.integer  "location_id"
    t.integer  "study_id"
    t.integer  "user_id"
    t.integer  "subject_id"
    t.datetime "date"
    t.boolean  "neuro_navigation_used"
    t.boolean  "cnbs_staff_used"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "stimulation_sub_sub_types", :force => true do |t|
    t.string   "name"
    t.integer  "stimulation_sub_type_id"
    t.float    "interpulse_interval"
    t.float    "interburst_interval"
    t.float    "intertrain_interval"
    t.float    "frequency"
    t.integer  "trains_count"
    t.integer  "pulses_per_train"
    t.integer  "bursts_per_train"
    t.integer  "pulses_per_burst"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "stimulation_sub_types", :force => true do |t|
    t.string   "name"
    t.integer  "stimulation_type_id"
    t.float    "interpulse_interval"
    t.float    "interburst_interval"
    t.float    "intertrain_interval"
    t.float    "frequency"
    t.integer  "trains_count"
    t.integer  "pulses_per_train"
    t.integer  "bursts_per_train"
    t.integer  "pulses_per_burst"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "stimulation_types", :force => true do |t|
    t.string   "name"
    t.float    "interpulse_interval"
    t.float    "interburst_interval"
    t.float    "intertrain_interval"
    t.float    "frequency"
    t.integer  "trains_count"
    t.integer  "pulses_per_train"
    t.integer  "bursts_per_train"
    t.integer  "pulses_per_burst"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "stimulations", :force => true do |t|
    t.datetime "date"
    t.integer  "subject_id"
    t.integer  "study_id"
    t.integer  "stimulation_type_id"
    t.integer  "stimulation_sub_type_id"
    t.integer  "stimulation_sub_sub_type_id"
    t.integer  "stimulation_device_session_id"
    t.integer  "stimulation_session_id"
    t.boolean  "sham"
    t.integer  "brain_area_id"
    t.float    "intensity"
    t.float    "paired_pulse_intensity"
    t.integer  "frequency"
    t.float    "interpulse_interval"
    t.float    "interburst_interval"
    t.float    "intertrain_interval"
    t.integer  "trains_count"
    t.integer  "pulses_per_train"
    t.integer  "bursts_per_train"
    t.integer  "pulses_per_burst"
    t.float    "duration"
    t.boolean  "neuro_navigation_used"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "studies", :force => true do |t|
    t.string   "name"
    t.string   "irb_number"
    t.text     "description"
    t.boolean  "repository_approved"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "study_populations", :force => true do |t|
    t.integer  "population_id"
    t.integer  "study_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "study_staffs", :force => true do |t|
    t.integer  "study_id"
    t.integer  "user_id"
    t.boolean  "is_principle"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "subjects", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.string   "secondary_phone"
    t.string   "address"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.date     "date_of_birth"
    t.string   "mrn"
    t.integer  "ethnicity_id"
    t.integer  "race_id"
    t.string   "handedness"
    t.boolean  "tms_safe"
    t.text     "tms_safe_comment"
    t.integer  "visits_count"
    t.integer  "scan_sessions_count"
    t.integer  "scans_count"
    t.integer  "stimulation_device_sessions_count"
    t.integer  "stimulation_sessions_count"
    t.integer  "stimulations_count"
    t.integer  "age"
    t.string   "gender"
    t.boolean  "contactable"
    t.string   "height"
    t.string   "weight"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  create_table "task_types", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "tasks", :force => true do |t|
    t.integer  "subject_id"
    t.integer  "visit_id"
    t.integer  "task_type_id"
    t.integer  "taskable_id"
    t.string   "taskable_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first_name",                                :null => false
    t.string   "last_name",                                 :null => false
    t.string   "position"
    t.boolean  "admin",                  :default => false, :null => false
    t.boolean  "enabled",                :default => true,  :null => false
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",        :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.boolean  "welcomed",               :default => false
    t.boolean  "needs_password_reset",   :default => true
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

  create_table "visits", :force => true do |t|
    t.datetime "date"
    t.integer  "subject_id"
    t.integer  "study_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
