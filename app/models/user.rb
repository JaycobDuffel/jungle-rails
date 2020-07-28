class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password, :length => {
    :minimum => 8,
    :too_short => 'password must be 8 characters'
  }, :on => :create

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

  def authenticate_self(a, b)
    self.class.authenticate_with_credentials(a, b)
  end

end
