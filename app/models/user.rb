# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
class User < ApplicationRecord
  has_many :organization_users, dependent: :destroy
  has_many :organizations, through: :organization_users
  has_many :devices, dependent: :destroy

  validates :email,
    presence: true,
    uniqueness: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[email]
  end
end
