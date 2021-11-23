class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :address_line
      t.string :city
      t.string :state
      t.integer :zip

      t.timestamps
    end
  end
end
