require 'rails_helper'

RSpec.describe RolePermission, type: :model do
  let(:role_permission) { create(:role_permission, role: create(:role), permission: create(:permission)) }

  it { should belong_to(:role) }
  it { should belong_to(:permission) }
  describe 'validate uniq pair' do
    it do
      role_permission
      should validate_uniqueness_of(:role_id).scoped_to(:permission_id)
    end
  end
end
