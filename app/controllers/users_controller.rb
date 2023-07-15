class UsersController < ApplicationController
    include ApplicationHelper
    before_action :set_user  

    def show  
      unless current_user
        flash[:alert] = 'Sign in required'
        redirect_to new_user_session_path
      end
    end

    def account_info
      unless authorized_user?
        flash[:alert] = 'Unauthorized to view this page'
        redirect_to root_path
      end
    end
  
    private
  
      def set_user
        @user = User.find(params[:id])
      end
  
end
  