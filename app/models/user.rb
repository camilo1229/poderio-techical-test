class User < ApplicationRecord
  include BCrypt
  belongs_to :tenant

  validates_presence_of :login, :password, :token

  before_save :encrypt_password, if: :password_changed?

  def validate_password(insecure)
    Password.new(self.password) == insecure
  end

  private
    def encrypt_password
      self.password = Password.create(password)
    end

end
