class User < ApplicationRecord
  # Validations for name and email
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  # Password validation
  has_secure_password  # This automatically adds password-related functionality
end
