# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id           :bigint           not null, primary key
#  discarded_at :datetime
#  email        :string(255)      not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_users_on_discarded_at  (discarded_at)
#  index_users_on_email         (email) UNIQUE
#
class User < ApplicationRecord
  include Discard::Model

  has_many :organization_users, dependent: :destroy
  has_many :organizations, through: :organization_users
  has_many :devices, dependent: :destroy

  validates :email,
    presence: true,
    uniqueness: true

  after_discard do
    organization_users.discard_all
    devices.discard_all
  end

  after_undiscard do
    organization_users.undiscard_all
    devices.undiscard_all
  end

  after_destroy :clear_active_users_cache
  after_save :clear_active_users_cache

  def self.ransackable_attributes(_auth_object = nil)
    %w[email]
  end

  def self.active_users
    Rails.cache.fetch("users:active", expires_in: 10.minutes) do
      kept
    end
  end

  private

  def clear_active_users_cache
    Rails.cache.delete("users:active")
  end
end
