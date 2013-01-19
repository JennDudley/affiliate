class Location < ActiveRecord::Base
  attr_accessible :state

has_many :affiliates

end
