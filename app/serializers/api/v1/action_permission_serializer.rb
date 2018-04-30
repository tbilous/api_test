class Api::V1::ActionPermissionSerializer < ActiveModel::Serializer
  attributes :id, :type, :slug
end
