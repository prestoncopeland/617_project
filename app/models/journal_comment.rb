class JournalComment < ActiveRecord::Base

  belongs_to :creator, foreign_key: :user_id, class_name: 'User'
  belongs_to :entry

  validates :body, presence: true

end
