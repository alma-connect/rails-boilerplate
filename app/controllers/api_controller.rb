class ApiController < ApplicationController

  def organization_name
    org = Organization.where(id: params[:id]).first
    name = org&.name
    respond_to do |format|
      format.json { render :json => {name: name} }
    end
  end

  def cors_enabled
    response.headers["Access-Control-Allow-Origin"] = "*"
  end
end