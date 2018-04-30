class Api::V1::RolesPermissionsSerializer < ActiveModel::Serializer
  attributes :id, :slug, :slug
  belongs_to :role
end
