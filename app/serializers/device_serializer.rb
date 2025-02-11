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
class DeviceSerializer < ActiveModel::Serializer
  attributes :id, :serial_number, :device_type

  belongs_to :user, serializer: Simple::UserSerializer
end
