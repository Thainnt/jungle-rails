class User < ActiveRecord::Base
  has_secure_password

  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  validates :password, confirmation: true
  validates :email, uniqueness: { case_sensitive: false}
  validates :password, length: {minimum: 8}

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip)
    if user && user.authenticate(password)
      user
    end
  end
  
end
