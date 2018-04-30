require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:user_roles).dependent(:destroy) }
  it { should have_many(:roles).through(:user_roles) }
  it { should have_many(:role_permissions).through(:roles) }
  it { should have_many(:user_permissions).dependent(:destroy) }
  it { should have_many(:permissions).through(:user_permissions) }
  it { should have_many(:user_role_permissions).through(:role_permissions).source(:permission) }
  it { should validate_presence_of :name }
  it { should validate_presence_of :email }
  it { is_expected.to allow_value('email@addresse.foo').for(:email) }
  it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
end
