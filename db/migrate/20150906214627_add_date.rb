class AddDate < ActiveRecord::Migration
  def change
  	  	add_column :promotions, :expiration, :date

  end
end
