require 'digest/sha2'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me

  # validates :name, :presence => true, :uniqueness => true
  validates :password, :confirmation => true
  
  # attr_accessor :password_confirmation
  # attr_reader   :password

  # validate :password_must_be_present

  # Make sure there is always an admin present
  after_destroy :ensure_an_admin_remains

  # def User.encrypt_password(password, salt)
  #   Digest::SHA2.hexdigest(password + "wibble" + salt)
  # end

  # def User.authenticate(name, password)
  #   if user = find_by_name(name)
  #     if user.hashed_password == encrypt_password(password, user.salt)
  #       user
  #     end
  #   end
  # end

  # # 'password' is a virtual attribute
  # def password=(password)
  #   @password = password
  #   if password.present?
  #     generate_salt
  #     self.hashed_password = self.class.encrypt_password(password, salt)
  #   end
  # end

  # private
  #   def password_must_be_present
  #     errors.add(:password, "Missing password") unless hashed_password.present?
  #   end

  #   def generate_salt
  #     self.salt = self.object_id.to_s + rand.to_s
  #   end

  #   # make sure we're not deleting the only admin
  #   def ensure_an_admin_remains
  #     if User.count.zero?
  #       raise "OH NOES! you can't delete the last user"
  #     end
  #   end
end
