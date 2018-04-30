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

  describe 'POST #grant_permission' do
    let(:role) { create(:role) }
    let(:permission) { create(:permission) }

    let(:params) do
      {
        id: role.id,
        permission_id: permission.id,
        format: :json
      }
    end

    subject { post :grant_permission, params: params }

    it { expect { subject }.to change(RolePermission, :count) }

    it do
      subject
      expect(response.status).to eq 200
    end
  end

  describe 'POST #remove_permission' do
    let(:role) { create(:role) }
    let(:permission) { create(:permission) }
    let!(:role_permission) { create(:role_permission, role: role, permission: permission) }

    let(:params) do
      {
        id: role.id,
        permission_id: permission.id,
        format: :json
      }
    end

    subject { delete :remove_permission, params: params }

    it { expect { subject }.to change(RolePermission, :count) }

    it do
      subject
      expect(response.status).to eq 200
    end
  end

  describe 'DELETE #destroy' do
    let!(:role) { create(:role) }
    let(:params) do
      {
        id: role.id,
        format: :json
      }
    end

    subject { post :destroy, params: params }

    it { expect { subject }.to change(Role, :count) }
  end
end
