class User < ActiveRecord::Base

  has_secure_password

  validates :first_name, :last_name, presence: true
  validates :email, { presence: true, uniqueness: { case_sensitive: false } }
  validates :password, presence: true, length: { minimum: 5 }
  validates :password_confirmation, presence: true, length: { minimum: 5 }

  def self.authenticate_with_credentials(email, password)
    email = email.strip.downcase
    @user = self.find_by('email ILIKE ?', email)
    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end

end