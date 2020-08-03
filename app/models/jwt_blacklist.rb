# frozen_string_literal: true

class JwtBlacklist < ApplicationRecord
  self.table_name = 'jwt_blacklists'

  include Devise::JWT::RevocationStrategies::Denylist
end
