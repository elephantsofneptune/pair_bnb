class ListingsController < ApplicationController

	def show
		@listing = Listing.find(params[:id])
		@user = User.find(@listing.user_id)
	end

	def new
		@listing = Listing.new
	end

	def index
		@listing = Listing.all
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
      params.require(:listing).permit(:description, :accomodates, :city, :address, :price, :image, :start_date, :end_date )
    end

    def edit
    	@listing = Listing.find(params[:id])
    end

    def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listing_url, notice: 'Listing was successfully destroyed.' }
    end
  end

  def update
	@listing = Listing.find(params[:id])
	    respond_to do |format|
	      if @listing.update(listing_params)
	        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
	      else
	        format.html { render :edit }
	    end
	end
end


end

