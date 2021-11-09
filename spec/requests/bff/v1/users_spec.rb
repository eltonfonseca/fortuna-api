# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Bff::V1::UsersController, type: :request do
  describe 'POST /bff/v1/users' do
    subject(:create_user) { post bff_v1_users_path, params: payload }

    context 'when user not exists' do
      context 'when params are correct' do
        let(:payload) do
          {
            user: {
              name: 'Nome',
              last_name: 'Sobrenome',
              email: 'teste@teste.com',
              password: '123456'
            }
          }
        end

        it 'returns status created' do
          create_user

          expect(response).to have_http_status :created
        end

        it 'returns a new user' do
          create_user

          expect(User.count).to eq 1
        end

        it 'returns a user name' do
          create_user

          expect(User.last.name).to eq payload[:user][:name]
        end

        it 'returns a user name' do
          create_user

          expect(User.last.last_name).to eq payload[:user][:last_name]
        end
      end
    end

    context 'when user already exists' do
      let(:payload) do
        {
          user: {
            name: 'Nome',
            last_name: 'Sobrenome',
            email: 'teste@teste.com',
            password: '123456'
          }
        }
      end
      let!(:user) { create :user, email: payload[:user][:email] }

      it 'returns ok status' do
        create_user

        expect(response).to have_http_status :unprocessable_entity
      end

      it 'returns error message' do
        create_user

        expect(JSON.parse(response.body)['errors']).to eq({ 'email' => ['E-mail já existe'] })
      end
    end
  end
end
