# == Schema Information
#
# Table name: profiles
#
#  id                  :integer          not null, primary key
#  username            :string(255)
#  first_name          :string(255)
#  last_name           :string(255)
#  email               :string(255)
#  country             :string(255)
#  time_zone           :string(255)
#  native_language     :string(255)
#  blog_url            :string(255)
#  description         :text
#  created_at          :datetime
#  updated_at          :datetime
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  study_language      :string(255)
#

class Profile < ActiveRecord::Base

	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

	validates :username, presence: true
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, presence: true
	validates :country, presence: true
	validates :time_zone, presence: true
	validates :native_language, presence: true
	validates :blog_url, presence: true
	validates :description, presence: true
	#validates :avatar, presence: true

	default_scope order: 'profiles.created_at DESC'
end
