class AddTdcsFieldsToStimulations < ActiveRecord::Migration
  def change
    add_column :stimulations, :polarity, :string
    add_column :stimulations, :side, :string
  end
end
