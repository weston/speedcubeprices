class Updatepuzzles < ActiveRecord::Migration
  def change
  	add_column :puzzles, :name, :string
  	add_column :puzzles, :description, :string
  end
end
