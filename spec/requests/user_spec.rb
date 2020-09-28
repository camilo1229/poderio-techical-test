require 'rails_helper'

describe 'Tenants API' do

  let!(:tenant_1) {create(:tenant_1)}

  # TODO:
  # Uncomment this creating factory for user_1 belonging to tenant_1. Remember to create User model
  # Look at params_hash object to make it fit properly.

  #let!(:user_1) {create(:user_1)}
  let!(:user_1) {create(:user_1, tenant: tenant_1 )}

  describe "POST #authenticate" do

    it "returns success authentication" do
      params_hash = {:username => 'hernan', :password => '123456'}
      post '/users/authenticate.json', params: params_hash
      expect(response).to have_http_status(:success)
      json_object = JSON.parse(response.body)
      expect(json_object['status']).to eq('ok')
      expect(json_object['token']).to eq('123')
    end

    it "returns non-success authentication" do
      params_hash = {:username => 'hernan', :password => 'nopwd'}
      post '/users/authenticate.json', params: params_hash
      expect(response).to have_http_status(:success)
      json_object = JSON.parse(response.body)
      expect(json_object['status']).to eq('no_pwd')
    end


  end

end
