class RemoveDateFromAffiliate < ActiveRecord::Migration

def change
	remove_column :affiliates, :date
end

end
