class CreateSuvivors < ActiveRecord::Migration[6.0]
  def change
    create_table :suvivors do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
