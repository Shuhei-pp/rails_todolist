class ApplicationController < ActionController::Base
    before_action :session_user

    def session_user
        @current_user = User.find_by(id: session[:user_id])
    end

    def reject_user
        if @current_user == nil
            flash[:notice]="ログインしてください"
            redirect_to("/login")
        end
    end

    def accept_user
        if @current_user
            flash[:notice]="ログイン済みです"
            redirect_to("/home/top")
        end
    end

end
