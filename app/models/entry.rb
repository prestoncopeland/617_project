class Entry < ActiveRecord::Base
  belongs_to :journal
  has_many :journal_comments, :dependent => :destroy

  validates :title, :language, :presence => true
  validates :entry, :presence => true, :length => {:minimum => 6}

end