# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'POST /signup', type: :request do
  let(:params) do
    {
      user: {
        name: 'Teste',
        last_name: 'teste last name',
        email: 'user@example.com',
        password: 'password@123456'
      }
    }
  end

  context 'when user is unauthenticated' do
    before { post api_v1_signup_path, params: params }

    it 'returns created' do
      expect(response).to have_http_status :created
    end

    it 'returns a new user' do
      expect(User.count).to eq(1)
    end

    it 'returns a user name' do
      expect(User.last.name).to eq(params[:user][:name])
    end

    it 'returns a user name' do
      expect(User.last.last_name).to eq(params[:user][:last_name])
    end
  end

  context 'when user already exists' do
    let!(:user) { create(:user, email: params[:user][:email]) }

    before do
      post api_v1_signup_path, params: params
    end

    it 'returns bad request status' do
      expect(response).to have_http_status :not_acceptable
    end
  end
end
