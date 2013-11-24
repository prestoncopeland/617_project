class Article < ActiveRecord::Base
  belongs_to :user

  validates :level, :title, :content, :presence => true
end
