class PasswordResetsController < ApplicationController

  before_filter      :load_user_using_perishable_token, :only => [:edit, :update]
  skip_before_filter :authorize_access
  
  def new
    render
  end

  def create
    @user = User.find_by_email(params[:email])  
    if @user  
      @user.deliver_password_reset_instructions!  
      flash[:notice] = "Email sent, please check your email"
      redirect_to root_url  
    else  
      flash[:error] = "Email address not found"  
      redirect_to new_password_reset_url
    end      
  end

  def edit  
    render  
  end  
  
  def update  
    @user.password = params[:user][:password]  
    @user.password_confirmation = params[:user][:password_confirmation]  
    if @user.save  
      flash[:notice] = "Password successfully updated"  
      redirect_to current_user.entry_page_path
    else  
      render :action => :edit  
    end  
  end  
  
  private  

  def load_user_using_perishable_token
    @user = User.find_using_perishable_token(params[:format])
    unless @user
      flash[:error] = "Could not locate your account. Please try again."
      redirect_to root_url
    end
  end

end
