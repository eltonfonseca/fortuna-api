# frozen_string_literal: true

class User < ApplicationRecord
  enum role: %i[user vip admin]

  after_initialize :set_default_role, if: :new_record?

  devise :confirmable,
         :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JwtBlacklist

  validates_presence_of :name

  private

  def set_default_role
    self.role ||= :user
  end
end
