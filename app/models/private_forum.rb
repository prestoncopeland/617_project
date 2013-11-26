class PrivateForum < ActiveRecord::Base
  belongs_to :user
  belongs_to :tution_session
  has_many :messages, :dependent => :destroy

  def teacher
    self.tution_session.user
  end
end
