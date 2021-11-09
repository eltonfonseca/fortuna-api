# frozen_string_literal: true

class Bff::V1::AuthController < Bff::V1::BffController
  skip_before_action :authenticate_user!, only: :login

  def login
    user = User.find_by_email(login_params[:email])

    if user&.authenticate(login_params[:password])
      token, exp = JsonWebToken.encode(user_id: user.id)

      render json: { token: token, exp: exp.strftime('%d-%m-%Y %H:%M') }, status: :created
    else
      render json: { error: 'Acesso negado!' }, status: :unauthorized
    end
  end

  private

  def login_params
    params.require(:user).permit(:email, :password)
  end
end
