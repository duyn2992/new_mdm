# frozen_string_literal: true

class Simple::UserSerializer < ActiveModel::Serializer
  attributes :id, :email
end
