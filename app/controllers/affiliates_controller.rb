class AffiliatesController < ApplicationController
  # GET /affiliates
  # GET /affiliates.json
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
    @affiliate.save

    # if @affiliate.visitors.match(/\D/) != nil 
    #   flash[:notice] = "Cannot have any comma's in the visitors input field"
    #   render 'new'
    #   return
    # end

    if @affiliate.errors.any? 
      flash[:error]
      render "/affiliates/new"
      return
    end
     
    # @affiliate.visitors = @affiliate.visitors.to_i

    # states = ['Arkansas', 'Colorado', 'Illinois', 'North Carolina', 'Rhode Island', 'Connecticut']
    # if states.include?(@affiliate.location.state); @affiliate.visitors < 10000
    #     redirect_to home_url, notice: 'Thanks your application is being processed' 
    # else
    #     redirect_to @affiliate, notice: 'Welcome to the Trunk Club Affiliate Program'
    # end
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
