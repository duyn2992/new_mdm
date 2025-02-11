# frozen_string_literal: true

FactoryBot.define do
  factory :organization_user do
    user { nil }
    organization { nil }
  end
end
