# frozen_string_literal: true

class Users::Create
  def initialize(params)
    @params = params
  end

  def call
    @new_user = User.new @params

    return save_user if @new_user.valid?

    [{ errors: @new_user.errors.messages }, :unprocessable_entity]
  end

  private

  def save_user
    @new_user.save

    [UserSerializer.new(@new_user).json, :created]
  end
end
