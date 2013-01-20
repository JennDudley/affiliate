class ChangeFormatInMyTable < ActiveRecord::Migration

def change
  change_column :affiliates, :visitors, :string
end

end
