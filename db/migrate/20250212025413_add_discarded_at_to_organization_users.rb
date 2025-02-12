# frozen_string_literal: true

class AddDiscardedAtToOrganizationUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :organization_users, :discarded_at, :datetime
    add_index :organization_users, :discarded_at
  end
end
