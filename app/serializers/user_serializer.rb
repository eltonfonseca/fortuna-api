# frozen_string_literal: true

class UserSerializer
  def initialize(user)
    @user = user
  end

  def json
    {
      id: @user.id,
      name: @user.name,
      last_name: @user.last_name,
      role: @user.role,
      email: @user.email
    }
  end
end
