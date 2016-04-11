class ListingsController < ApplicationController

	def show
		@listing = Listing.find(params[:id])
		@user = User.find(@listing.user_id)
	end

	def new
		@listing = Listing.new
	end

	def index
		@listings = Listing.all
	end

	 def create
	 	@user = current_user
	    @listing = @user.listings.new(listing_params)
	    # @listing.user_id = current_user.id
	    respond_to do |format|
	      if @listing.save
	      	# byebug
	        format.html { redirect_to listing_path(@listing.id), notice: 'Listing was successfully created.' }
	      else
	        format.html { render :new }
	      end
	    end
	 end

	def listing_params
      params.require(:listing).permit(:description, :accomodates, :city, :price, :photo_url )
    end


end

