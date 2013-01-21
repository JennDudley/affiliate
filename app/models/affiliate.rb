class Affiliate < ActiveRecord::Base
  attr_accessible :content, :email, :first_name, :last_name, :location_id, :visitors, :website

  belongs_to :location

  validates_uniqueness_of :email
  validates_presence_of :email, :first_name, :last_name, :location_id, :visitors, :website
  # validates_no_comma :on => :visitors => :create

  # def no_comma
  	
  # end


end
