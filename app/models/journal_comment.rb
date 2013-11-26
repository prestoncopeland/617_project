class JournalComment < ActiveRecord::Base
  belongs_to :entry
  belongs_to :user
  belongs_to :journal
end
