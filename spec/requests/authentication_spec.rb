# frozen_string_literal: true

require 'rails_helper'

def decoded_jwt_token_from_response(response)
  token = response.headers['Authorization'].split.last
  JWT.decode(token, ENV['SECRET_KEY'], true)
end

RSpec.describe 'Authentication', type: :request do
  describe 'POST /api/v1/login' do
    context 'when user confirmed email' do
      let(:user) { create(:user, :confirmed) }
      let(:params) do
        {
          user: {
            email: user.email,
            password: user.password
          }
        }
      end

      context 'when params are correct' do
        before { post api_v1_login_path, params: params }

        it 'returns status ok' do
          expect(response).to have_http_status :ok
        end

        it 'returns JTW token in authorization header' do
          expect(response.headers['Authorization']).to be_present
        end

        it 'returns valid JWT token' do
          decoded_token = decoded_jwt_token_from_response(response)
          expect(decoded_token.first['sub']).to be_present
        end
      end

      context 'when login params are incorrect' do
        before { post api_v1_login_path, params: 'empty' }

        it 'returns unauthorized status' do
          expect(response).to have_http_status :unauthorized
        end
      end
    end

    context 'when user no confirmed email' do
      let(:user) { create(:user) }
      let(:params) do
        {
          user: {
            email: user.email,
            password: user.password
          }
        }
      end

      before { post api_v1_login_path, params: params }

      it 'returns unauthorized status' do
        expect(response).to have_http_status :unauthorized
      end
    end
  end

  describe 'DELETE /api/v1/logout' do
    before { delete api_v1_logout_path }

    it 'returns 204, no content' do
      expect(response).to have_http_status :no_content
    end
  end
end
