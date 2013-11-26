class Message < ActiveRecord::Base
  belongs_to :private_forum

  def sender_user
    User.find(self.sender)
  end

  def receiver_user
    User.find(self.receiver)
  end
end
