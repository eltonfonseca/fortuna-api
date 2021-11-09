# frozen_string_literal: true

module DefaultErrors
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordInvalid, with: :render_errors_model
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    rescue_from JWT::DecodeError, with: :jwt_decode_error
  end

  def render_errors_model(errors)
    render json: { errors: errors }, status: :unprocessable_entity
  end

  def render_not_found(error)
    render json: { errors: error.message }, status: :not_found
  end

  def jwt_decode_error(_error)
    render json: { errors: 'Não autorizado!' }, status: :unauthorized
  end
end
