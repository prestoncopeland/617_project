class Entry < ActiveRecord::Base
  belongs_to :journal
  has_many :journal_comments

  validates :title, presence: true
  validates :language, presence: true
  validates :entry, presence: true, length: {minimum: 6}

end