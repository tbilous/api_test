class User < ApplicationRecord
  include Permissionsable

  has_many :user_roles, dependent: :destroy
  has_many :roles, through: :user_roles
  has_many :role_permissions, through: :roles
  has_many :user_permissions, dependent: :destroy
  has_many :permissions, through: :user_permissions
  has_many :user_role_permissions, through: :role_permissions, source: :permission, class_name: 'Permission'

  validates_presence_of :email, :name
  validates :email, format: /\A[^@\s]+@[^@\s]+\z/, uniqueness: true
end
