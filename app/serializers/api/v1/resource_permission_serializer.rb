class Api::V1::ResourcePermissionSerializer < ActiveModel::Serializer
  attributes :id, :type, :slug
end
