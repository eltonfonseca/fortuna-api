# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Bff::V1::AuthController, type: :request do
  describe 'POST /bff/v1/login' do
    context 'when user exists' do
      let(:user) { create :user }
      let(:payload) do
        {
          user: {
            email: user.email,
            password: user.password
          }
        }
      end

      context 'when params are correct' do
        before { post bff_v1_authenticate_path, params: payload }

        it 'returns status created' do
          expect(response).to have_http_status :created
        end

        it 'returns JTW token' do
          expect(JSON.parse(response.body)['token']).to be_present
        end

        it 'returns exp time' do
          expect(JSON.parse(response.body)['exp']).to be_present
        end
      end

      context 'when login params are incorrect' do
        let(:payload) do
          {
            user: {
              email: 'wrong_email',
              password: 'wrong_password'
            }
          }
        end

        before { post bff_v1_authenticate_path, params: payload }

        it 'returns unauthorized status' do
          expect(response).to have_http_status :unauthorized
        end
      end
    end
  end
end
