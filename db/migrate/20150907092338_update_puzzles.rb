class UpdatePuzzles < ActiveRecord::Migration
  def change
  	add_column :puzzles, :brand, :string
  end
end
