# frozen_string_literal: true

class Bff::V1::BffController < ApplicationController
  include DefaultErrors

  before_action :authenticate_user!

  def authenticate_user!
    @current_user = Users::Authenticate.new(request).call
  end
end
