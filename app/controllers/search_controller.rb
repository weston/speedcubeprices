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
		@names = Array.new
		@prices = Array.new
		@stores = Array.new
		@numResults = 0

		searchTerms = query.split(" ")
		if params[:thecubicle] == "on" then
			@puzzles = thecubicleSearch(searchTerms)
			@puzzles.each do |key, value|
				@names.push(key)
				@prices.push(value)
				@stores.push("thecubicle.us")
				@numResults += 1
			end
		end
		if params[:speedcubeshop] == "on" then
			@scspuzzles = speedcubeshopSearch(searchTerms);
			@scspuzzles.each do |key, value|
				@names.push(key)
				@prices.push(value)
				@stores.push("speedcubeshop.com")
				@numResults += 1
			end
		end
		if params[:cubezz] == "on" then
			@cubezzpuzzles = cubezzSearch(query);
			@cubezzpuzzles.each do |key, value|
				@names.push(key)
				@prices.push(value)
				@stores.push("cubezz.com")
				@numResults += 1
			end
		end
		if params[:cubes4speed] == "on" then
			@cubes4speedpuzzles = cubes4speedSearch(searchTerms);
			@cubes4speedpuzzles.each do |key, value|
				@names.push(key)
				@prices.push(value)
				@stores.push("cubes4speed.com")
				@numResults += 1
			end
		end
	end

	
end
