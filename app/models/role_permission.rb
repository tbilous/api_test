class RolePermission < ApplicationRecord
  belongs_to :role
  belongs_to :permission

  validates_uniqueness_of :permission_id, scope: :role_id
end
