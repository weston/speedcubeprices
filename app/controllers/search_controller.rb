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
			@data += getData(scsPuzzles,scsLinks,'SpeedCubeShop.com')
		end
		if params[:cubezz] == "on" then
			cubezzPuzzles,cubezzLinks = cubezzSearch(query);
			@data += getData(cubezzPuzzles,cubezzLinks,'Cubezz.com')
		end
		if params[:cubes4speed] == "on" then
			cubes4speedPuzzles,cubes4speedLinks = cubes4speedSearch(searchTerms);
			@data += getData(cubes4speedPuzzles,cubes4speedLinks,'Cubes4Speed.com')
		end
		@data= sortData(@data,searchTerms)
	end

	##Returns an array of hashes of the data
	def getData(puzzles,links,store)
		if puzzles == nil then
			return []
		end
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

	def sortData(data,searchTerms)
		data.sort!{|x,y|  rankHash(x,searchTerms ) <=> rankHash(y,searchTerms)}
		return data
	end


	#What percent of the name is directly from the search term?
	def rankHash(hash,searchTerms)
		name = hash['name'].downcase
		length = name.length
		searchTerms.each do |term|
			name.slice! term.downcase
		end
		ignoreThese.each do |term|
			name.slice! term.downcase
		end
		score = (name.length * 100 /length)
		return score
	end
	def ignoreThese()
		return ['3x3','2x2','4x4','5x5','6x6','7x7']
	end
end
