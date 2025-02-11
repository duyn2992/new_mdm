# frozen_string_literal: true

class CreateDevices < ActiveRecord::Migration[7.2]
  def change
    create_table :devices do |t|
      t.references :user, null: false, foreign_key: true
      t.string :serial_number
      t.integer :device_type

      t.timestamps
    end

    add_index :devices, :serial_number, unique: true
  end
end
