class User < ApplicationRecord
    has_secure_password
    has_many :posts
    has_many :genres, through: :posts
    validates :username, uniqueness: true
    validates :username, :password, presence: true 
    validates :bio, length: { maximum: 200 }

    def self.find_or_create_by_omniauth(some_hash)
        login_username = some_hash["extra"]["raw_info"]["login"]
        avatar_pic = some_hash["extra"]["raw_info"]["avatar_url"]
        self.where(username: login_username).first_or_create do |user|
            #editing details here
            user.image = avatar_pic
            user.password = SecureRandom.hex
        end 
    end 
end
