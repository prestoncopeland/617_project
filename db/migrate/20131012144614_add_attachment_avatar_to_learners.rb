class AddAttachmentAvatarToLearners < ActiveRecord::Migration
  def self.up
    change_table :learners do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :learners, :avatar
  end
end
