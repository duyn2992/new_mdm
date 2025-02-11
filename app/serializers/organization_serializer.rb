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
class OrganizationSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :users, serializer: Simple::UserSerializer
end
