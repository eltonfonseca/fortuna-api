# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { FFaker::NameBR.first_name }
    last_name { FFaker::NameBR.last_name }
    email { FFaker::Internet.email }
    password { FFaker::Internet.password }

    trait :admin do
      role { 'admin' }
    end

    trait :confirmed do
      confirmed_at { DateTime.current }
    end
  end
end
