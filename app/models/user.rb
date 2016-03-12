class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	has_many :posts
	has_many :comments

	validates :firstname, presence: true
	validates :lastname, presence: true
	emailFormat= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: emailFormat }
	validates :password, presence: true

end
