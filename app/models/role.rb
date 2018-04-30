class Role < ApplicationRecord
  has_many :user_roles
  has_many :role_permissions
  has_many :users, through: :user_roles
  has_many :permissions, through: :role_permissions

  validates :name, presence: true, uniqueness: true, case_sensitive: false

  def add_permission(p)
    permissions << p
  end
end
