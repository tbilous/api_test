require 'rails_helper'

RSpec.describe UserPermission, type: :model do
  let(:user_permission) { create(:user_permission, user: create(:user), permission: create(:permission)) }
  it { should belong_to(:user) }
  it { should belong_to(:permission) }
  describe 'validate uniq pair' do
    it do
      user_permission
      should validate_uniqueness_of(:permission_id).scoped_to(:user_id)
    end
  end
end
