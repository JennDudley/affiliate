class AffiliatesController < ApplicationController

  before_filter :ensure_correct_user, :except => [:new, :create, :index]
  before_filter :require_admin, :only => [:index]

  # Should this stuff be in the model?
  def ensure_correct_user
    if session[:id] != params[:id].to_i 
      elsif session[:id] == nil
       redirect_to root_url, :notice => "You must be an Admin"
     end
   end
  # if you are trying to go to users/1 then you better be user #1
   
  def require_admin   
     if Affiliate.find(session[:id]).email != "tech@trunkclub.com"
       redirect_to root_url, :notice => 'Must be admin.'
     end
   end
   # we're running this check only on the index page

  def index
    @affiliates = Affiliate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @affiliate }
    end
  end


  def show
    @affiliate = Affiliate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @affiliate }
    end
  end

  def new
    @affiliate = Affiliate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @affiliate }
    end
  end


  def edit
    @affiliate = Affiliate.find(params[:id])
  end


  def create
    @affiliate = Affiliate.new(params[:affiliate])

    if @affiliate.save
      if @affiliate.needs_tobe_approved
        redirect_to @affiliate, notice: 'application will be need to be approved'
      else 
        redirect_to @affiliate, notice: 'application was accepted!'
      end
    else
     @affiliate.errors     
     render "new"
    end

  end
  
  # def approve_enrollment
  #     @affiliate.update_attributes(:enrolled_at => Time.now)
  #     AffiliateMailer.welcome_email(@affiliate).deliver
  # end


  def update
    @affiliate = Affiliate.find(params[:id])

    respond_to do |format|
      if @affiliate.update_attributes(params[:affiliate])
        format.html { redirect_to @affiliate, notice: 'Affiliate was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @affiliate.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end