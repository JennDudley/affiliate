class AddEnrolledAtToAffiliate < ActiveRecord::Migration
  def change
  	add_column :affiliates, :enrolled_at, :date
  end
end
