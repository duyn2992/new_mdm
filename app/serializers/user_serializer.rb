# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  address    :string(255)
#  birth_date :datetime
#  email      :string(255)
#  first_name :string(255)
#  last_name  :string(255)
#  phone      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :phone, :email, :address, :birth_date
end
