class Update < ActiveRecord::Migration
  def change
  	add_column :puzzles, :type, :string
  end
end
