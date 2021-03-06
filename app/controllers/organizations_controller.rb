class OrganizationsController < ApiController

  before_action :authenticate_admin!, except: [:index,:show]
  before_action :authenticate_user!, only: [:edit]
  before_action :cors_enabled

  def index
    @organizations = Organization.all
  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(organization_params)
    if @organization.save
      flash[:notice] = "Organization created successfully"
      redirect_to organization_path(@organization)
    else
      render 'new'
    end
  end

  def edit
    @organization = Organization.find(params[:id])
  end

  def update
    @organization = Organization.find(params[:id])
    if @organization.update(organization_params)
      flash[:notice] = "Your article has been successfully updated"
      redirect_to organization_path(@organization)
    else
      render 'edit'
    end

  end

  def destroy
    @organization.destroy
    respond_to do |format|
      format.html { redirect_to organizations_url, notice: 'Organzation is successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show
    @organization = Organization.find(params[:id])
  end

  def authenticate_user!
    @organization = Organization.find(params[:id])
    if current_user.present?
      if current_user.id.to_s == @organization.organization_coordinator || current_user.admin
        session[:user_return_to] = request.url
      else
        flash[:notice] = "You do not have access to this action"
        redirect_to root_path
      end
    end
  end

  def authenticate_admin!
    if current_user.present?
      if current_user.admin
        session[:user_return_to] = request.url
      else
        flash[:notice] = "You need admin access for this action"
        redirect_to root_path
      end
    else
      flash[:notice] = "Current User not present"
      redirect_to root_path
    end
  end

  private

  def organization_params
    params.require(:organization).permit(:name, :title)
  end
end