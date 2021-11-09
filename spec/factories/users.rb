# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { FFaker::NameBR.first_name }
    last_name { FFaker::NameBR.last_name }
    email { FFaker::Internet.email }
    password { FFaker::Internet.password }

    trait :admin do
      role { :admin }
    end

    trait :vip do
      role { :vip }
    end
  end
end
