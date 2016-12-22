class AddDetails < ActiveRecord::Migration[5.0]
  def change
    add_reference :pets, :user, index: true
  end
end
