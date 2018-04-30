class Permission < ApplicationRecord
  has_many :user_permissions, dependent: :destroy
  has_many :role_permissions, dependent: :destroy
  has_many :users, through: :user_permissions
  has_many :roles, through: :role_permissions

  validates_presence_of :type, :slug
  validates_uniqueness_of :slug, scope: :type, case_sensitive: false
end
