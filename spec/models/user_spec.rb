require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_uniqueness_of :email }
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :last_name }
    it { is_expected.to validate_length_of(:password).is_at_least 6 }

    context 'with valid email' do
      let(:user) { build :user, email: 'teste@teste.com' }

      it 'returns valid' do
        expect(user.valid?).to be_truthy
      end
    end

    context 'with invalid email' do
      let(:user) { build :user, email: '1123testecom' }

      it 'returns invalid' do
        expect(user.valid?).to be_falsey
      end
    end
  end

  %i[admin vip].each do |role|
    context "when user is #{role}" do
      let(:user) { build :user, role }
  
      it "returns role #{role.to_s}" do
        expect(user.role).to eq role.to_s
      end
    end
  end

  context 'when user not specify role' do
    let(:user) { build :user }

    it 'returns default role' do      
      expect(user.user?).to be_truthy
    end
  end
end
