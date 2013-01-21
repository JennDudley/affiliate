class Affiliate < ActiveRecord::Base
  attr_accessible :content, :email, :first_name, :last_name, :location_id, :visitors, :website

  belongs_to :location

  validates_uniqueness_of :email
  validates_presence_of :email, :first_name, :last_name, :location_id, :visitors, :website
  before_create :visitors_no_comma
  after_save :location_visitors
  validates_format_of :website, :with => /^((http|https):\/\/)?[a-z0-9]+([-.]{1}[a-z0-9]+).[a-z]{2,5}(:[0-9]{1,5})?(\/.)?$/ix
  validates_format_of :email, :with => /^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/i

  def visitors_no_comma
  	self.visitors = visitors.gsub(/\,/,"") 
  	self.visitors = self.visitors.to_i
  end

  def location_visitors
  	states = ['Arkansas', 'Colorado', 'Illinois', 'North Carolina', 'Rhode Island', 'Connecticut']
  	if states.include?(self.location.state); self.visitors < 10000
  		redirect_to home_url, notice: 'Thanks your application is being processed' 
  	else
    	redirect_to @affiliate, notice: 'Welcome to the Trunk Club Affiliate Program'
  	end
  end

end

# EMAIL VALIDATION
# begins with one or more word characters, period, percent, plus, or dashes
# then one at symbol
# then one or more word characters, dashes, and then a period
# ends with 2 or more word characters
# case-insensitive
# got advice from this website: http://rawsyntax.com/blog/rails-3-email-validation/

# WEBSITE VALIDATION
# allows the user to choose whether or not they would like to use http:// ...
# got advice from this stackoverflow: http://stackoverflow.com/questions/1128168/validation-for-url-domain-using-regex-rails