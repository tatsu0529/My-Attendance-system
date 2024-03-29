class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  def admin_user
    redirect_to root_url unless current_user.admin?
  end
  
      def logged_in_user
  unless logged_in?
    flash[:danger] = "ログインしてください。"
    redirect_to login_url
  end
end
    
    def correct_user
      redirect_to(root_url) unless current_user?(@user)
    end
  
end
