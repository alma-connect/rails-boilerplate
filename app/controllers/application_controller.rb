class ApplicationController < ActionController::Base

  def logged_in
    !!current_user
  end

  def require_user
    if !logged_in
      flash[:notice] = "You must be logged in to perform this action"
      redirect_to root_path
    end
  end
end
