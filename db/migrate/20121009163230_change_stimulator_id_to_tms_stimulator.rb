class ChangeStimulatorIdToTmsStimulator < ActiveRecord::Migration
  def change
    rename_column :devices, :stimulator_id, :tms_stimulator_id
    add_column :devices, :tdcs_stimulator_id, :integer

    rename_column :devices, :stimulator_model_id, :tms_stimulator_model_id
    add_column :devices, :tdcs_stimulator_model_id, :integer

    rename_column :motor_thresholds, :stimulator_id, :tms_stimulator_id

    rename_column :stimulation_device_sessions, :stimulator_id, :tms_stimulator_id
    add_column :stimulation_device_sessions, :tdcs_stimulator_id, :integer

    rename_column :stimulation_device_sessions, :stimulator_model_id, :tms_stimulator_model_id
    add_column :stimulation_device_sessions, :tdcs_stimulator_model_id, :integer

    rename_column :subjects, :stimulations_count, :tms_stimulations_count
    add_column :subjects, :tdcs_stimulations_count, :integer

    rename_table :stimulation_types, :tms_stimulation_types
    rename_table :stimulation_sub_types, :tms_stimulation_sub_types
    rename_table :stimulation_sub_sub_types, :tms_stimulation_sub_sub_types

    rename_column :tms_stimulation_sub_types, :stimulation_type_id, :tms_stimulation_type_id
    rename_column :tms_stimulation_sub_sub_types, :stimulation_sub_type_id, :tms_stimulation_sub_type_id

    rename_column :stimulations, :stimulation_type_id, :tms_stimulation_type_id
    rename_column :stimulations, :stimulation_sub_type_id, :tms_stimulation_sub_type_id
    rename_column :stimulations, :stimulation_sub_sub_type_id, :tms_stimulation_sub_sub_type_id
  end
end
