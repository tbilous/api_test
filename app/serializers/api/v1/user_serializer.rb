class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name
  has_many :roles
  has_many :user_role_permissions
  has_many :permissions
end
