class UserPermission < ApplicationRecord
  belongs_to :user
  belongs_to :permission

  validates_uniqueness_of :user_id, scope: :permission_id
end
