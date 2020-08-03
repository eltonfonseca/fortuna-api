FactoryBot.define do
  factory :jwt_blacklist do
    jti { FFaker::Internet.domain_name }
    exp { FFaker::Time.datetime }
  end
end
