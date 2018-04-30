class Api::V1::RoleSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :permissions
end
