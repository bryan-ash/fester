class UsersController < ApplicationController
  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = current_user
  end

  # POST /users
  def create
    @user = User.new(params[:user])

    if @user.save
      flash[:notice] = 'Registration successful.'
      redirect_to root_url
    else
      render :action => 'new'
    end
  end

  # PUT /users/1
  def update
    @user = current_user

    if @user.update_attributes(params[:user])
      flash[:notice] = 'Successfully updated profile.'
      redirect_to root_url
    else
      render :action => "edit"
    end
  end

end
