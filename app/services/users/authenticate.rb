# frozen_string_literal: true

class Users::Authenticate
  def initialize(request)
    @request = request
  end

  def call
    header = @request.headers['Authorization']
    token = header.split.last if header

    decoded = JsonWebToken.decode token
    User.find(decoded[:user_id])
  end
end
