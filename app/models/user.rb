class User < ApplicationRecord
    has_many :phone_numbers, dependent: :delete_all
    has_one :address, dependent: :destroy
    accepts_nested_attributes_for :address, allow_destroy: true
    accepts_nested_attributes_for :phone_numbers, allow_destroy: true
    
    validates :username, presence: true, length: {minimum: 3, maximum: 20}
    validates :email, presence: true
    validates :password, presence: true
    validates :active, presence: true

end