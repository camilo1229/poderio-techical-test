class ClustersController < ApplicationController

  def index
    # TODO: Unmock this.
    # Return all the clusters of the user's tenant based on the received token
    # Remember to implemente ApplicationController#set_tenant
    render json: Cluster.select(:id, :name), status: :ok
  end

end
