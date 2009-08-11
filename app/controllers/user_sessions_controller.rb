class UserSessionsController < ApplicationController

  skip_before_filter :authorize_access
  
  def new
    redirect_to current_user.entry_page_path if current_user

    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = 'Successfully logged in.'
      redirect_to current_user.entry_page_path
    else
      flash[:error] = 'Invalid username or password'
      render :action => 'new'
    end
  end

  def destroy
    @user_session = UserSession.find
    if @user_session
      @user_session.destroy
      flash[:notice] = 'Successfully logged out.'
    end

    redirect_to root_url
  end
  
end
