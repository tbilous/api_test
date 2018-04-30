shared_examples 'success response' do
  it 'returns success response' do
    expect(response).to be_success
  end
end
