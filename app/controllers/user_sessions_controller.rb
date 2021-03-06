class UserSessionsController < ApplicationController
  
  skip_before_filter :require_user, :only => [:new, :create]
  
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Successfully logged in."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @user_session = UserSession.find
    if ! @user_session.nil?
      @user_session.destroy
      flash[:notice] = "Successfully logged out."
    end
    redirect_to root_url
  end
end
