require 'rails_helper'

RSpec.describe Api::V1::UsersController do
  describe 'POST #create' do
    let(:user) { attributes_for(:user) }
    let(:form_params) { {} }

    let(:params) do
      {
        user: user,
        format: :json
      }.merge(form_params)
    end

    context 'valid data' do
      subject { post :create, params: params }

      it { expect { subject }.to change(User, :count) }

      it_behaves_like 'success response'
    end

    it_behaves_like 'invalid params js', 'empty name', model: User do
      let(:form_params) { { name: '' } }
    end
    it_behaves_like 'invalid params js', 'empty email', model: User do
      let(:form_params) { { email: '' } }
    end
    it_behaves_like 'invalid params js', 'wrong email', model: User do
      let(:form_params) { { email: 'sjabcasc363sac' } }
    end
  end

  describe 'GET #show' do
    let(:user) { create(:user) }
    let(:params) { { id: user.id, format: :json } }

    subject { get :show, params: params }

    before { subject }

    it_behaves_like 'success response'
    %w(id name email).each do |attr|
      it "user contains #{attr}" do
        expect(response.body).to have_json_path(attr.camelize(:lower))
      end
    end
  end

  describe 'GET #index' do
    let!(:users) { create_list(:user, 2) }
    let(:params) { { format: :json } }

    subject { get :index, params: params }

    before { subject }

    it_behaves_like 'success response'

    it 'contains users' do
      expect(response.body).to have_json_size(2)
    end
  end

  describe 'GET #search' do
    let(:user) { create(:user) }
    let(:params) { { user_email: user.email, format: :json } }

    subject { get :search, params: params }
    before { subject }

    it_behaves_like 'success response'

    %w(id name email).each do |attr|
      it "user contains attributes #{attr}" do
        expect(response.body).to be_json_eql(user.send(attr.camelize(:lower).to_sym).to_json).at_path(attr)
      end
    end
  end

  describe 'POST #grant_permission' do
    let(:user) { create(:user) }
    let(:permission) { create(:permission) }

    let(:params) do
      {
        id: user.id,
        permission_id: permission.id,
        format: :json
      }
    end

    subject { post :grant_permission, params: params }

    it { expect { subject }.to change(UserPermission, :count) }

    it do
      subject
      expect(response.status).to eq 200
    end
  end

  describe 'POST #remove_permission' do
    let(:user) { create(:user) }
    let(:permission) { create(:permission) }
    let!(:user_permission) { create(:user_permission, user: user, permission: permission) }

    let(:params) do
      {
        id: user.id,
        permission_id: permission.id,
        format: :json
      }
    end

    subject { delete :remove_permission, params: params }

    it { expect { subject }.to change(UserPermission, :count) }

    it do
      subject
      expect(response.status).to eq 200
    end
  end
end
