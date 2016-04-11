class SearchListingsController < ApplicationController

 require 'rubygems'
 require 'tire'
 require 'yajl/json_gem'


	def index
		if params[:query].present?
		@listings = Listing.search(params[:query], load: true)
		else
		@listings = Listing.all
		end
	end

	def show
		@listing = Listing.find(params[:id])
	end

end
