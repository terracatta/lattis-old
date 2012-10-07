
#
# Create Default Administrator Account
#
admin = User.find_or_create_by_email({
  email: 'admin.user@lattis.app',
  first_name: 'admin',
  last_name: 'user',
  password: 'lattis',
  admin: true
})

populations = [
  { name: "Alzheimer's" },
  { name: "Parkinson's" },
  { name: "Autism" },
  { name: "Aphasia" },
  { name: "Stroke" },
  { name: "Depression" },
  { name: "Schizophrenia" },
  { name: "Anorexia" },
  { name: "Bulimia" },
  { name: "Binge-Eating Disorder" },
  { name: "Obesity" },
  { name: "Traumatic Brain Injury" },
  { name: "Bipolar Disorder" },
  { name: "Visual Field Neglect" },
  { name: "Deaf" },
  { name: "Blind" },
  { name: "Healthy Control" }
].map { |params| Population.find_or_create_by_name(params) }

races = [
  { name: "American Indian / Alaska Native" },
  { name: "Asian" },
  { name: "Black" },
  { name: "Native Hawaiian / Pacific Islander" },
  { name: "White" },
  { name: "Multi-Racial" },
  { name: "No Response" }
].map { |params| Race.find_or_create_by_name(params) }

ethnicities = [
  { name: "Hispanic" },
  { name: "Non-Hispanic" },
  { name: "No Response" }
].map { |params| Ethnicity.find_or_create_by_name(params) }

brain_areas = [
  {
    short_name: "IPL",
    name: "inferior parietal lobule",
    hemisphere: "left"
  },

  {
    short_name: "IPL",
    name: "inferior parietal lobule",
    hemisphere: "right"
  },

  {
    short_name: "DLPFC",
    name: "dorsolateral prefrontal cortex",
    hemisphere: "left"
  },

  {
    short_name: "DLPFC",
    name: "dorsolateral prefrontal cortex",
    hemisphere: "right"
  },

  {
    short_name: "TPJ",
    name: "temporal parietal junction",
    hemisphere: "left"
  },

  {
    short_name: "TPJ",
    name: "temporal parietal junction",
    hemisphere: "left"
  },

  {
    short_name: "M1",
    name: "primary motor cortex",
    hemisphere: "right"
  },

  {
    short_name: "M1",
    name: "primary motor cortex",
    hemisphere: "right"
  },

  {
    short_name: "VLPFC",
    name: "ventrolateral prefrontal cortex",
    hemisphere: "left"
  },

  {
    short_name: "VLPFC",
    name: "ventrolateral prefrontal cortex",
    hemisphere: "right"
  },

  {
    short_name: "V1",
    name: "primary visual cortex",
    hemisphere: "left"
  },

  {
    short_name: "V1",
    name: "primary visual cortex",
    hemisphere: "right"
  }
].map { |params| BrainArea.find_or_create_by_name(params) }

scan_formats = [
  { name: "Nifti" },
  { name: "PAR/REC" },
  { name: "HDR/IMG - Analyze" },
  { name: "DICOM" },
].map { |params| ScanFormat.find_or_create_by_name(params) }

scan_types = [
  { name: "fMRI" },
  { name: "Structural MRI" },
  { name: "DTI" },
].map { |params| ScanType.find_or_create_by_name(params) }

scan_sub_types = [
  {
    :name => "Perfusion",
    :scan_type_id => "1"
  },

  {
    :name => "Resting State",
    :scan_type_id => "1"
  },

  {
    :name => "T1 Weighted",
    :scan_type_id => "2"
  },

  {
    :name => "T2 Weighted",
    :scan_type_id => "2"
  },

  {
    :name => "Active Task",
    :scan_type_id => "1"
  }
].map { |params| ScanSubType.find_or_create_by_name(params) }

stimulation_types = [
  { name: "rTMS" },
  { name: "Single Pulse" },
  { name: "Paired Pulse" },
  { name: "Triple Pulse" }
].map { |params| StimulationType.find_or_create_by_name(params) }

stimulation_sub_types = [
  {
    name: "Theta Burst" ,
    stimulation_type_id: "1"
  },

  {
    name: "Intrahemispheric Paired Pulse",
    stimulation_type_id: "2"
   },

  {
    name: "Interhemispheric Paired Pulse",
    stimulation_type_id: "2"
  },
].map { |params| StimulationSubType.find_or_create_by_name(params) }

stimulation_sub_sub_types = [
  {
    name: "ICF",
    stimulation_sub_type_id: "2"
  },

  {
    name: "SIHI",
    stimulation_sub_type_id: "3"
  },

  {
    name: "LICI",
    stimulation_sub_type_id: "2"
  },

  {
    name: "LIHI",
    stimulation_sub_type_id: "3"
  },

  {
    name: "SICI",
    stimulation_sub_type_id: "2"
  },

  {
    name: "cTBS",
    stimulation_sub_type_id: "1",
    frequency: 50,
    trains_count: 1,
    pulses_per_burst: 3,
    pulses_per_train: nil,
    bursts_per_train: 200,
    interburst_interval: 200,
    interpulse_interval: 2,
    intertrain_interval: nil,
  },

  {
    name: "iTBS",
    stimulation_sub_type_id: "1",
    frequency: 50,
    trains_count: 20,
    pulses_per_burst: 3,
    pulses_per_train: nil,
    bursts_per_train: 10,
    interburst_interval: 200,
    interpulse_interval: 2,
    intertrain_interval: 8000
  },
].map { |params| StimulationSubSubType.find_or_create_by_name(params) }

locations = [
  {
    name: "Motor Control Lab 2",
    building_name: "Kirstein",
    floor_number: "4",
    room_number: "449",
    key_number: "C173388",
    phone: "",
  },

  {
    name: "GCRC - TMS Lab",
    building_name: "Gryzmisch",
    floor_number: "8",
    room_number: "",
    key_number: "JABA7",
    phone: "",
  },

  {
    name: "CNBS Lab 5",
    building_name: "Kirstein",
    floor_number: "1",
    room_number: "178",
    key_number: "AABB5",
    phone: "70374",
  },

  {
    name: "CNBS Lab 4",
    building_name: "Kirstein",
    floor_number: "1",
    room_number: "179",
    key_number: "AABB2",
    phone: "70372",
  },

  {
    name: "Clinical Exam Room",
    building_name: "Kirstein",
    floor_number: "1",
    room_number: "169",
    key_number: "AABB5",
    phone: "70311",
  },

  {
    name: "Voice Room",
    building_name: "Kirstein",
    floor_number: "4",
    room_number: "436",
    key_number: "C173362",
    phone: "70223",
  },

  {
    name: "BUMC MRI",
    building_name: "Evans Biomedical Research Center",
    floor_number: "Basement",
    room_number: "",
    key_number: "",
    phone: "6174142370",
  },

  {
    name: "Post-Doc Office",
    building_name: "Kirstein",
    floor_number: "4",
    room_number: "423",
    key_number: "",
    phone: "",
  },

  {
    name: "Research Assistant Office",
    building_name: "Kirstein",
    floor_number: "1",
    room_number: "164",
    key_number: "AABB2",
    phone: "",
  },

  {
    name: "Alvaro's Office",
    building_name: "Kirstein",
    floor_number: "1",
    room_number: "157",
    key_number: "AABB1",
    phone: "70202",
  },

  {
    name: "Nurse's Office",
    building_name: "Kirstein",
    floor_number: "1",
    room_number: "151",
    key_number: "AABB6",
    phone: "70303",
  },

  {
    name: "Edwin's Office",
    building_name: "Kirstein",
    floor_number: "1",
    room_number: "170A",
    key_number: "AABB4",
    phone: "75281",
  },

  {
    name: "Andrea's Office",
    building_name: "Kirstein",
    floor_number: "1",
    room_number: "188",
    key_number: "AABB3",
    phone: "70237",
  },

  {
    name: "Conference Room",
    building_name: "Kirstein",
    floor_number: "1",
    room_number: "170",
    key_number: "AABB3",
    phone: "70371",
  },

  {
    name: "2nd Floor Post-Doc",
    building_name: "Kirstein",
    floor_number: "2",
    room_number: "231",
    key_number: "",
    phone: "",
  },

  {
    name: "Mark Eldaief's Office",
    building_name: "Kirstein",
    floor_number: "4",
    room_number: "446",
    key_number: "",
    phone: "",
  },

  {
    name: "Miguel's Office",
    building_name: "Kirstein",
    floor_number: "4",
    room_number: "455",
    key_number: "AABB3",
    phone: "",
  },

  {
    name: "Neuronetics Room",
    building_name: "Kirstein",
    floor_number: "1",
    room_number: "185",
    key_number: "AABB3",
    phone: "70353",
  },

  {
    name: "Clinical Magstim Rooom",
    building_name: "Kirstein",
    floor_number: "1",
    room_number: "183",
    key_number: "AABB5",
    phone: "",
  },

  {
    name: "Hayat's Desk",
    building_name: "1",
    floor_number: "158",
    room_number: "",
    key_number: "",
    phone: "",
  },

  {
    name: "Dan's Office",
    building_name: "Kirstein",
    floor_number: "1",
    room_number: "153",
    key_number: "AABB1",
    phone: "",
  }
].map { |params| Location.find_or_create_by_name(params) }

stimulator_models = [
  { name: "Magstim Rapid 2" },
  { name: "MagPro" },
  { name: "Magstim Super Rapid" },
  { name: "Neuronetics" },
  { name: "Nexstim" },
  { name: "Neuronetics Neurostar" },
  { name: "Magstim Monopulse Bistim" }
].map { |params| StimulatorModel.find_or_create_by_name(params) }

stimulators = [
  {
    name: "Clinical Rapid 2 (Clinical Program Lab 3)",
    serial: (1..7).to_a.join,
    stimulator_model_id: stimulator_models.first.id,
  }
].map { |params| Stimulator.find_or_create_by_name(params) }

coil_models = [
  { name: "Nexstim Monopulse" },
  { name: "Nexstim Bipulse" },
  { name: "Magpro Nexstim Coil" },
  { name: "Nexstim Coil" },
  { name: "MagPro Nexstim Coil" },
  { name: "MagPro Brainsight Coil" },
  { name: "Neuronetics Coil" },
  { name: "Magstim Vacuum Coil Active" },
  { name: "Magstim Vacuum Coil Sham" },
  { name: "Magstim" }
].map { |params| CoilModel.find_or_create_by_name(params) }

coils = [
  {
    name: "Figure-8 Coil Blue)",
    serial: (1..7).to_a.join,
    coil_model_id: coil_models.first.id,
  },
].map { |params| Coil.find_or_create_by_name(params) }

task_types = [
  { name: "Serial Reaction Time Test" },
  { name: "Choice Reaction Test" },
  { name: "Stop Signal Reaction Test" },
  { name: "Stroop" }
].map { |params| TaskType.find_or_create_by_name(params) }
