shared_examples 'permissions' do
  describe 'POST #create' do
    model = described_class.controller_name.classify.safe_constantize
    let(:permission) { attributes_for(:permission) }
    let(:form_params) { {} }
    let(:params) do
      {
        permission: permission,
        format: :json
      }.merge(form_params)
    end
    subject { post :create, params: params }

    it { expect { subject }.to change(model, :count) }

    it 'check type' do
      subject
      expect(response.body).to be_json_eql(model.last.send('type'.to_sym).to_json).at_path('type')
    end
  end
end
