 class Reservation < ActiveRecord::Base
    belongs_to :listing
    belongs_to :user
    belongs_to :payment

    
end


