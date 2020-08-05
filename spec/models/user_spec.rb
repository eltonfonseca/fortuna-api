# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'must be have presence name' do
      is_expected.to validate_presence_of :name
    end
  end
end
