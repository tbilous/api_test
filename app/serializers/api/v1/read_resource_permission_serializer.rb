class Api::V1::ReadResourcePermissionSerializer < ActiveModel::Serializer
  attributes :id, :type, :slug
end
