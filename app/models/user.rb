class User < ActiveRecord::Base
  has_one :profile

  has_secure_password validations: false

  validates :name, presence: true, uniqueness: true
  validates :password, presence: true, on: :create, length: {minimum: 6}

end
