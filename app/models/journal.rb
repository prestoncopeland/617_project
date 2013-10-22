class Journal < ActiveRecord::Base
  has_many :entries
  belongs_to :user

  validates :title, presence: true

end