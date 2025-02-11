# frozen_string_literal: true

# == Schema Information
#
# Table name: devices
#
#  id            :bigint           not null, primary key
#  device_type   :integer          default("ios"), not null
#  serial_number :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :bigint           not null
#
# Indexes
#
#  index_devices_on_serial_number  (serial_number) UNIQUE
#  index_devices_on_user_id        (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Device < ApplicationRecord
  belongs_to :user

  enum :device_type,
    {
      ios: 0,
      android: 1,
      windows: 2
    }

  validates :serial_number,
    presence: true,
    uniqueness: true

  validates :device_type,
    presence: true,
    inclusion: {in: device_types.keys}

  def self.ransackable_attributes(_auth_object = nil)
    %w[serial_number device_type user_id]
  end
end
