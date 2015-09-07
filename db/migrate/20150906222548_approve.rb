class Approve < ActiveRecord::Migration
  def change
  	add_column :promotions, :approved, :boolean, default: true
  end
end
