class Affiliate < ActiveRecord::Base
  attr_accessible :content, :date, :email, :first_name, :last_name, :location_id, :visitors, :website

belongs_to :location

end
