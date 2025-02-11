# frozen_string_literal: true

FactoryBot.define do
  factory :device do
    serial_number { "MyString" }
    device_type { 1 }
    user { nil }
  end
end
