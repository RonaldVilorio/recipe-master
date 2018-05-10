class User < ApplicationRecord
    has_secure_password
    has_many :recipes
    has_many :ratings
    validates_presence_of :name, :password
    validates :password, confirmation: true
    validates :password_confirmation, presence: true
    validates :email, uniqueness: true
    validates_format_of :email, :with => /@/
    def self.find_or_create_by_omniauth(auth_hash)
        self.where(email: auth_hash['info']['email']).first_or_create do |user| 
            user.name = auth_hash['info']['name']
            user.password = SecureRandom.hex
        end 
    end
end
