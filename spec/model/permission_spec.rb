require 'rails_helper'

RSpec.describe Permission, type: :model do
  it { should have_many(:user_permissions) }
  it { should have_many(:role_permissions) }
  it { should have_many(:users).through(:user_permissions) }
  it { should have_many(:roles).through(:role_permissions) }
end
