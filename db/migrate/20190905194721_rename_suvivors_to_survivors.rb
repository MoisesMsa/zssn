class RenameSuvivorsToSurvivors < ActiveRecord::Migration[6.0]
  def change
  	rename_table :suvivors, :survivors
  end
end
