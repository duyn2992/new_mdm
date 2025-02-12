# frozen_string_literal: true

class AddDiscardedAtToDevices < ActiveRecord::Migration[7.2]
  def change
    add_column :devices, :discarded_at, :datetime
    add_index :devices, :discarded_at
  end
end
