class AddPasswordDigestToAffiliate < ActiveRecord::Migration
  def change
  	add_column :affiliates, :password_digest, :string
  end
end
