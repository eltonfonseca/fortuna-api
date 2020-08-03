# frozen_string_literal: true

class Api::V1::Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    build_resource(sign_up_params)

    if resource.valid?
      resource.save!
      render json: resource, status: :created
    else
      render json: errors, status: :not_acceptable
    end
  end

  private

  def errors
    {
      status: 406,
      title: 'Not Acceptable',
      detail: resource.errors
    }
  end
end
