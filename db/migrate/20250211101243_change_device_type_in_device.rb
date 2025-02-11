# frozen_string_literal: true

class ChangeDeviceTypeInDevice < ActiveRecord::Migration[7.2]
  def up
    change_column :devices, :device_type, :integer, null: false, default: 0
  end

  def down
    change_column :devices, :device_type, :integer
  end
end
