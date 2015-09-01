require 'rubygems'
require 'nokogiri' 
require 'open-uri'
require "base64"
class SearchController < ApplicationController
	def index
		query = params[:search]
		if query.length < 1 then
			return
		end
		searchTerms = query.split(" ")
		# @puzzles = thecubicleSearch(searchTerms)
		# @scspuzzles = speedcubeshopSearch(searchTerms);
		# @cubezzpuzzles = cubezzSearch(query);
		@cubes4speedpuzzles = cubes4speedSearch(searchTerms);
	end

	
end
