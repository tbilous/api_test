class UserPermission < ApplicationRecord
  belongs_to :user
  belongs_to :permission

  validates_uniqueness_of :permission_id, scope: :user_id
end
