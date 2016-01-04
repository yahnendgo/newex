class User < ActiveRecord::Base
	has_many :posts
	has_many :comments
	has_attached_file :avatar, :styles =>
	{ :medium => "300x300>", :thumb => "100x100>"},
	:default_url => "/images/mymic.jpg"
	validates_attachment_content_type :avatar,
	:content_type => /\Aimage\/.*\Z/

	validates :email, presence: true
	validates :password, confirmation: true, presence: true
	validates :gender, inclusion: {in: ["male", "female"]}
	validates :username, presence: true, uniqueness: { message: "username is already in use"}

	before_validation :regulate_name, on: :create
 
 
	def regulate_name
	    self.fname = self.fname.downcase.titleize
	    self.lname = self.lname.downcase.titleize
	end


end
