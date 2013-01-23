class AffiliatesController < ApplicationController
  # GET /affiliates
  # GET /affiliates.json

  # before_filter :ensure_correct_user, :except => [:new, :create, :index]
  # before_filter :require_admin, :only => [:index]

  # Should this stuff be in the model?
  # def ensure_correct_user
  #   if session[:id] != params[:id].to_i
  #     redirect_to root_url, :notice => "You must be a User"
  #   end
  # end
  #  # if you are trying to go to users/1 then you better be user #1
   
  # def require_admin   
  #   if User.find(session[:id]).email != "tech@trunkclub.com"
  #     redirect_to root_url, :notice => 'Must be admin.'
  #   end
  # end
   # we're running this check only on the index page

  def index
    @affiliates = Affiliate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @affiliates }
    end
  end

  # GET /affiliates/1
  # GET /affiliates/1.json
  def show
    @affiliate = Affiliate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @affiliate }
    end
  end

  # GET /affiliates/new
  # GET /affiliates/new.json
  def new
    @affiliate = Affiliate.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @affiliate }
    end
  end

  # GET /affiliates/1/edit
  def edit
    @affiliate = Affiliate.find(params[:id])
  end

  # POST /affiliates
  # POST /affiliates.json
  def create

    @affiliate = Affiliate.new(params[:affiliate])

    if @affiliate.save
      flash[:error]
      redirect_to "/signup"
    end

    def enrollment_needs_approval?
      states = ['Arkansas', 'Colorado', 'Illinois', 'North Carolina', 'Rhode Island', 'Connecticut']
      states.include?(@affiliate.location.state)
      @affiliate.visitors = @affiliate.visitors.to_i
      @affiliate.visitors < 10000
    end

    if enrollment_needs_approval?
       redirect_to home_url, notice: 'Thanks your application is being processed' 
    else
        @affiliate.update_attributes(:enrolled_at => Time.now)
        AffiliateMailer.welcome_email(@affiliate).deliver
        redirect_to home_url, notice: 'Please check email for a verification'
    end
  end

  def approve_enrollment
      @affiliate.update_attributes(:enrolled_at => Time.now)
      AffiliateMailer.welcome_email(@affiliate).deliver
  end

  # PUT /affiliates/1
  # PUT /affiliates/1.json
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

  # DELETE /affiliates/1
  # DELETE /affiliates/1.json
  def destroy
    @affiliate = Affiliate.find(params[:id])
    @affiliate.destroy

    respond_to do |format|
      format.html { redirect_to affiliates_url }
      format.json { head :no_content }
    end
  end
end
