class User < ActiveRecord::Base
  has_one :profile
  has_one :journal
  has_many :posts
  has_many :topics
  has_many :journal_comments

  has_secure_password validations: false

  validates :name, presence: true, uniqueness: true
  validates :password, presence: true, on: :create, length: {minimum: 6}

end
