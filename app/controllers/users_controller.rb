class UsersController < ApplicationController

  skip_before_action :set_tenant, only: [:authenticate]

  def authenticate
    # TODO: unmock this:
    # Create a model user with login, password, token and tenant_id and do a proper login
    if user = User.find_by(login: params[:username])
      if user.validate_password(params[:password])
        render json: {status: 'ok', token: user.token}, status: :ok
      else
        render json: {:status => 'no_pwd'}, status: 200
      end
    else
      render json: {message: "User not found"}, status: :not_found
    end
  end

end
