class CreatePets < ActiveRecord::Migration[5.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :gender
      t.integer :organisationid
      t.integer :age
      t.string :breed
      t.integer :locationzip

      t.timestamps
    end
  end
end
