# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Confirmation', type: :request do
  describe 'GET /api/v1/confirmation' do
    let!(:token) { Devise.friendly_token }
    let!(:sent_at) { Time.now.utc }
    let!(:user) { create(:user, confirmation_token: token, confirmation_sent_at: sent_at) }

    before do
      get api_v1_confirmation_url(user, confirmation_token: token)
    end

    it 'must redirect to any page' do
      expect(response).to have_http_status :found
    end

    it 'must confirm user' do
      expect(User.last).to be_confirmed
    end
  end
end
