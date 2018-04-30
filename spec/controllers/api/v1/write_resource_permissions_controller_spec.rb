require 'rails_helper'
require_relative 'concerns/permissions'

RSpec.describe Api::V1::WriteResourcePermissionsController, type: :controller do
  it_behaves_like 'permissions'
end
