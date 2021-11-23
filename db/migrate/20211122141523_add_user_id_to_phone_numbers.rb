class AddUserIdToPhoneNumbers < ActiveRecord::Migration[6.1]
  def change
    add_column :phone_numbers, :user_id, :int
  end
end
