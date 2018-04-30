require 'rails_helper'

RSpec.describe Api::V1::PermissionsController, type: :controller do
  describe 'GET #index' do
    let!(:permissions) { create_list(:permission, 2) }
    let(:params) { { format: :json } }

    subject { get :index, params: params }

    before { subject }

    it_behaves_like 'success response'

    it 'contains permissions' do
      expect(response.body).to have_json_size(2)
    end
  end
end
