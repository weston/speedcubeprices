class PuzzlesController < ApplicationController
	def index

	end

	def show
		@name = params[:id]
	end
	def add

	end

	def post_submit
		##From index
		puzzle = Puzzle.new
		puzzle.name = params[:name]
		puzzle.brand = params[:brand]
		puzzle.type = params[:type]
		puzzle.save()

		##save thecubicle link
		thecubicle = Link.new
		thecubicle.url = params[:thecubicle_link] #From name attribute
		thecubicle.puzzle_id = puzzle.id
		thecubicle.save()

		##save speedcubeshop link
		scs = Link.new
		scs.url = params[:speedcubeshop_link]
		scs.puzzle_id = puzzle.id
		scs.save

		##save cubezz link
		cubezz = Link.new
		cubezz = params[:cubezz_link]
		cubezz.puzzle_id = puzzle.id
		cubezz.save

		##save cubes4speed link
		cubes4speed = Link.new	
		cubes4speed = params[:cubes4speed_link]
		cubes4speed.puzzle_id = puzzle.id
		cubes4speed.save

		##ADD MORE HERE


		######################
		flash[:notice] = 'succesfully saved.'
		redirect_to '/puzzles/add'

	end
end
