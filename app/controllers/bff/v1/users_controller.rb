# frozen_string_literal: true

class Bff::V1::UsersController < Bff::V1::BffController
  skip_before_action :authenticate_user!, only: :create

  def create
    response, status = Users::Create.new(user_params).call

    render json: response, status: status
  end

  def index
    render json: User.all, status: :ok
  end

  private

  def user_params
    params.require(:user).permit(:name, :last_name, :email, :password)
  end
end
