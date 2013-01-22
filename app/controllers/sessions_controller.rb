class SessionsController < ApplicationController
  def new
  end

  def create
  	affiliate = Affiliate.find_by_email(params[:email])
    if affiliate != nil && affiliate.authenticate(params[:password])
      session[:id] = affiliate.id
      redirect_to affiliate_url(affiliate.id), :notice => "Welcome Back, #{affiliate.first_name}"
    else
      redirect_to login_url, :notice => "Sorry, Try Again"
    end
  end

  def destroy
  	session[:id] = nil
    redirect_to root_url
  end
end
