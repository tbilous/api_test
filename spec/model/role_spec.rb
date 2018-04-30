require 'rails_helper'

RSpec.describe Role, type: :model do
  it { should have_many(:user_roles).dependent(:destroy) }
  it { should have_many(:role_permissions).dependent(:destroy) }
  it { should have_many(:users).through(:user_roles) }
  it { should have_many(:permissions).through(:role_permissions) }
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of(:name).ignoring_case_sensitivity }
end
