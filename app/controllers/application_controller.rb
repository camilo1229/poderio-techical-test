class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_tenant

  protected
    def set_tenant
      if @current_user = User.find_by(token: params[:token])
        Apartment::Tenant.switch!(@current_user.tenant.tenant_key)
      end
    end

end
