class User < ApplicationRecord
  has_secure_password

  enum role: %i[user vip admin]

  after_initialize :set_default_role, if: :new_record?

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :name, :last_name, presence: true
  validates :password, length: { minimum: 6 }

  private

  def set_default_role
    self.role ||= :user
  end
end
