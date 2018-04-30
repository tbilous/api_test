require 'rails_helper'

RSpec.describe Api::V1::RolesController, type: :controller do
  describe 'POST #create' do
    let(:role) { attributes_for(:role) }
    let(:form_params) { {} }

    let(:params) do
      {
        role: role,
        format: :json
      }.merge(form_params)
    end

    context 'valid data' do
      subject { post :create, params: params }

      it { expect { subject }.to change(Role, :count) }
    end

    it_behaves_like 'invalid params js', 'empty name', model: User do
      let(:form_params) { { name: '' } }
    end
  end

  describe 'GET #index' do
    let!(:roles) { create_list(:role, 2) }
    let(:params) { { format: :json } }

    subject { get :index, params: params }

    before { subject }

    it_behaves_like 'success response'

    it 'contains roles' do
      expect(response.body).to have_json_size(2)
    end
  end
end
