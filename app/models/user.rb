class User < ApplicationRecord
    has_secure_password
    has_many :recipes
    def self.find_or_create_by_omniauth(auth_hash)
        self.where(uid: auth_hash['uid']).first_or_create do |user| 
            user.name = auth_hash['info']['name']
            user.email = auth_hash['info']['email']
            user.password = SecureRandom.hex
        end 
        binding.pry 
    end
end
