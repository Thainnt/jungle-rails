class User < ActiveRecord::Base
  has_secure_password

  validates :password, presence: true, confirmation: true, length: {minimum: 8}
  validates :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false}
  validates :first_name, presence: true
  validates :last_name, presence: true

  def self.authenticate_with_credentials(email, password)
    user = User.where('LOWER(email) = ?', email.strip.downcase).first
    if user && user.authenticate(password)
      user
    end
  end

end
