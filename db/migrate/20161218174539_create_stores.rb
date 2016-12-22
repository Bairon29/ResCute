class CreateStores < ActiveRecord::Migration[5.0]
  def change
    create_table :stores do |t|
      t.string :status
      t.string :name
      t.string :gender
      t.integer :organisationid
      t.integer :age
      t.string :breed
      t.integer :locationzip
      t.string :image

      t.timestamps
    end
  end
end
