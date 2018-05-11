class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :current_user
    before_action :require_logged_in, except: [:new, :create, :omnicreate, :index]
    # helper used to use method in navigation partial
    helper_method :current_user, :logged_in?
    
    
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    def logged_in?
        !!current_user
    end
    def require_logged_in
        redirect_to root_path unless logged_in?
    end
    def redirect_if_unauthorized
        unauth_user_access = params[:user_id] && current_user.id != params[:user_id].to_i
        redirect_to root_path if unauth_user_access
      end

end
