class Api::V1::WriteResourcePermissionSerializer < ActiveModel::Serializer
  attributes :id, :type, :slug
end
