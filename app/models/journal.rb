class Journal < ActiveRecord::Base
  has_many :entries, :dependent => :destroy
  has_many :journal_comments
  belongs_to :user

  validates :title, :presence => true

end