class ApplicationController < ActionController::Base
include JsonWebToken
  before_action :authenticate_user, except: [:login]
  def login
    @user = User.find_by(email: params[:email], password: params[:password])
    raise if @user.nil?
    if @user.role == 'customer'
      session[:current_user] = jwt_encode(email: @user.email)
      redirect_to front_path
    elsif @user.role == 'owner'
      session[:current_user] = jwt_encode(email: @user.email)
      redirect_to front_path
    else
      raise
    end
  rescue
    flash[:notice] = 'You are not authorized(Login First)'
    redirect_to root_path
  end

  def logout
    session.delete(:current_user)
    @current_user = nil
    redirect_to root_url, status: :see_other
  end
  private
    def authenticate_user
      decoded = jwt_decode(session[:current_user].split(' ').last)
      @current_user = User.find_by_email(decoded[:email])
      raise unless @current_user.present?
    rescue StandardError
      flash[:notice] = 'You are not authorized(Login First)'
      redirect_to root_path
    end
end
