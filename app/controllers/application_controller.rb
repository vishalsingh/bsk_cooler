class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
	  def not_found
	    raise ActionController::RoutingError.new('Not Found')
	  end

	  def after_sign_in_path_for(current_user)
	    if current_user.admin?
	      admin_path
	    else
	      root_path	
	    end
	  end

end
