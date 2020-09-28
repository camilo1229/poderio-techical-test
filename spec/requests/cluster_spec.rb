require 'rails_helper'

describe 'Tenants API' do

  let!(:tenant_1) {create(:tenant_1)}
  let!(:tenant_2) {create(:tenant_2)}


  before do
    Apartment::Tenant.switch!(tenant_1.tenant_key)
    create(:cluster_1_tenant_1)
    create(:cluster_2_tenant_1)
    Apartment::Tenant.switch!(tenant_2.tenant_key)
    create(:cluster_1_tenant_2)
    Apartment::Tenant.switch!('public')

    create(:user_1, tenant: tenant_1 )
    create(:user_2, tenant: tenant_2 )
  end

  describe "GET #index" do

    it "returns clusters for user with tenant 1" do
      get '/clusters/index.json?token=123'
      expect(response).to have_http_status(:success)
      json_object = JSON.parse(response.body)
      expect(json_object.length).to eq(2)
    end

    it "returns clusters for user with tenant 2" do
      get '/clusters/index.json?token=345'
      expect(response).to have_http_status(:success)
      json_object = JSON.parse(response.body)
      expect(json_object.length).to eq(1)
    end


  end

end
