require 'rubygems'
require 'nokogiri' 
require 'open-uri'
require "base64"
class SearchController < ApplicationController
	def index
		@data = Array.new
		#Array of hashes
		##{Name:name, Price:price, Store:store, Link:link}
		query = params[:search]
		if query.length < 1 then
			return
		end

		searchTerms = query.split(" ")
		if params[:thecubicle] == "on" then
			thecubiclePuzzles, thecubicleLinks = thecubicleSearch(searchTerms)
			@data += getData(thecubiclePuzzles,thecubicleLinks,'theCubicle.us')
		end
		if params[:speedcubeshop] == "on" then
			scsPuzzles, scsLinks = speedcubeshopSearch(searchTerms);
			@data += getData(scsPuzzles,scsLinks,'SpeedcubeShop.com')
		end
		if params[:cubezz] == "on" then
			cubezzPuzzles,cubezzLinks = cubezzSearch(query);
			@data += getData(cubezzPuzzles,cubezzLinks,'cubezz.com')
		end
		if params[:cubes4speed] == "on" then
			cubes4speedPuzzles,cubes4speedLinks = cubes4speedSearch(searchTerms);
			@data += getData(cubes4speedPuzzles,cubes4speedLinks,'cubes4speed.com')
		end
		puts @data
	end

	##Returns an array of hashes of the data
	def getData(puzzles,links,store)
		counter = 0
		data = Array.new
						#name, price
		puzzles.each do |key,value|
			hash = Hash.new
			hash["name"] = key
			hash["price"] = value
			hash["link"] = links[counter]
			hash["store"] = store
			counter += 1
			data.push(hash)
		end
		return data
	end
end
