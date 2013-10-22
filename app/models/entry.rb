class Entry < ActiveRecord::Base
  belongs_to :journal

  validates :title, presence: true
  validates :language, presence: true
  validates :entry, presence: true, length: {minimum: 6}

end