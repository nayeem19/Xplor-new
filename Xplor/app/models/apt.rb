class Apt < ActiveRecord::Base
    belongs_to :user
	belongs_to :category
	has_many :reviews

	has_attached_file :apt_img, :styles => { :apt_index => "250x350>", :apt_show => "325x475>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :apt_img, :content_type => /\Aimage\/.*\Z/
end