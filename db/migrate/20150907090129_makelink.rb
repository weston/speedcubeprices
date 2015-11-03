class Makelink < ActiveRecord::Migration
  def change
  	add_column :links, :store, :string
  	add_column :links, :url, :string
  end
end
