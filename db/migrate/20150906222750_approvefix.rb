class Approvefix < ActiveRecord::Migration
  def change
  	remove_column :promotions, :approved
  	add_column :promotions, :approved, :boolean, default: false
  end
end
