class User < ActiveRecord::Base
  has_one :profile, :dependent => :destroy
  has_one :journal, :dependent => :destroy
  has_many :posts, :dependent => :destroy
  has_many :topics, :dependent => :destroy
  has_many :journal_comments, :dependent => :destroy
  has_many :decks, :dependent => :destroy
  has_many :articles, :dependent => :destroy
  has_many :tution_sessions, :dependent => :destroy
  has_many :private_forums, :dependent => :destroy

  has_secure_password validations: false

  validates :name, presence: true, uniqueness: true
  validates :password, presence: true, on: :create, length: {minimum: 6}

  def is_teacher?
    self.teacher == true
  end

  def has_schedule(tution_session_id)
    self.private_forums.where("tution_session_id = ?", tution_session_id).present?
  end

end
