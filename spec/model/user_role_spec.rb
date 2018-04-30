require 'rails_helper'

RSpec.describe UserRole, type: :model do
  let(:user_role) { create(:user_role, user: create(:user), role: create(:role)) }
  it { should belong_to(:user) }
  it { should belong_to(:role) }

  describe 'validate uniq pair' do
    it do
      user_role
      should validate_uniqueness_of(:role_id).scoped_to(:user_id)
    end
  end
end
