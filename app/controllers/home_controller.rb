# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    render json: HomeSerializer.new.json, status: :ok
  end
end
