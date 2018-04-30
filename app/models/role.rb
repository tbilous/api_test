class Role < ApplicationRecord
  include Permissionsable

  has_many :user_roles, dependent: :destroy
  has_many :role_permissions
  has_many :users, through: :user_roles
  has_many :permissions, through: :role_permissions

  validates :name, presence: true, uniqueness: true, case_sensitive: false
end
