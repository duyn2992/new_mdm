# frozen_string_literal: true

# == Schema Information
#
# Table name: organizations
#
#  id         :bigint           not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_organizations_on_name  (name) UNIQUE
#
class Organization < ApplicationRecord
  has_many :organization_users, dependent: :destroy
  has_many :users, -> { kept }, through: :organization_users

  validates :name,
    presence: true,
    uniqueness: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[name]
  end
end
