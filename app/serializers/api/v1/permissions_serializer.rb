class Api::V1::PermissionsSerializer < ActiveModel::Serializer
  attributes :id, :type, :slug
end
