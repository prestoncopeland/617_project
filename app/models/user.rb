class User < ActiveRecord::Base
 attr_accessor :password, :name, :password_confirmation
 before_save :encrypt_password
 validates :name, presence: true, uniqueness: true, :length => { :in => 3..20 }

 validates :password, :confirmation => true #password_confirmation attr
 #validates_length_of :password, :in => 6..20, :on => :create

 validates :email, uniqueness: true

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.encrypted_password == BCrypt::Engine.hash_secret(password, user.salt)
        user
    else
        nil
    end
  end

  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.encrypted_password= BCrypt::Engine.hash_secret(password, salt)
    end
  end

  def clear_password
    self.password = nil
  end

end
