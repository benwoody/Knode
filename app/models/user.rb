# == Schema Information
# Schema version: 20101103170358
#
# Table name: users
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  pass       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  
  attr_accessor :pass
  attr_accessible :uname, :pass, :email, :pass_confirmation

  has_many :knodes

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  def title(knodes_title)
    knodes_title = @knodes.title
  end
  
  # Ensure a name/pass/email is given to setup an account
  validates :uname, :presence => true, :length => { :maximum => 50 }
  validates :pass, :presence => true, :confirmation => true, :length => { :within => 6..40 }
  validates :email, :presence => true, :format => { :with =>
email_regex }, :uniqueness => { :case_sensitive => false }

 before_save :encrypt_password

  # Check for matching passwords
  def has_password?(submitted_password)
   encrypted_password == encrypt(submitted_password)
  end

  def self.authenticate(email,submitted_password)
   user = find_by_email(email)
   return nil if user.nil?
   return user if user.has_password?(submitted_password)
  end
  
  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.salt == cookie_salt) ? user : nil
  end
  
  private
  
    def encrypt_password
     self.salt = make_salt if new_record?
     self.encrypted_password = encrypt(pass)
    end
    
    def encrypt(string)
     secure_hash("#{salt}--#{string}")
    end
    
    def make_salt
     secure_hash("#{Time.now.utc}--#{pass}")
    end
    
    def secure_hash(string)
     Digest::SHA2.hexdigest(string)
    end

end

