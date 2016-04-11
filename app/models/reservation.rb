 class Reservation < ActiveRecord::Base
    belongs_to :users, :listings
end


