class Updatepromo < ActiveRecord::Migration
  def change
  	add_column :promotions, :description, :string
  	add_column :promotions, :title, :string
  	add_column :promotions, :store_name, :string
  	add_column :promotions, :link, :string
  end
end
