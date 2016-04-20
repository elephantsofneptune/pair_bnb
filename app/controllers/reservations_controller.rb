class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  # GET /reservations
  # GET /reservations.json
  def index
    @reservations = Reservation.all
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
    @reservation = Reservation.find(params[:id])
    @stay = @reservation.listing.price.to_i*(@reservation.end_date - @reservation.start_date)
  end

  # GET /reservations/new
  def new
    @listing = Listing.find(params[:id])
    @user = User.find(@listing.user_id)
    @reservation = @listing.reservations.new
    @reservation.stay = @reservation.listing.price.to_i*(@reservation.end_date - @reservation.start_date)
  end

  # GET /reservations/1/edit
  def edit
    @reservation = Reservation.find(params[:id])
  end

  # POST /reservations
  # POST /reservations.json
  def create
    @reservation = current_user.reservations.new(reservation_params)
    @reservation.stay = @reservation.listing.price.to_i*(@reservation.end_date - @reservation.start_date)
    respond_to do |format|
      if @reservation.save
        format.html { redirect_to @reservation, notice: 'Reservation was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
    @reservation = Reservation.find(params[:id])
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def stay
    @reservation = Reservation.find(params[:id])
    @stay = @reservation.listing.price.to_i*(@reservation.end_date - @reservation.start_date)
    #@total_amount = @stay.to_i * @listing.price.to_i
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservations = Reservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:start_date, :end_date, :listing_id, :token, :stay)
    end
end
