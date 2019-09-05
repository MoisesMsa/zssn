class CreateInfecteds < ActiveRecord::Migration[6.0]
  def change
    create_table :infecteds do |t|
      t.references :survivor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
