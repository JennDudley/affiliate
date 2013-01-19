class CreateAffiliates < ActiveRecord::Migration
  def change
    create_table :affiliates do |t|
      t.string :first_name
      t.string :last_name
      t.integer :location_id
      t.string :website
      t.text :content
      t.integer :visitors
      t.string :email
      t.string :date

      t.timestamps
    end
  end
end
