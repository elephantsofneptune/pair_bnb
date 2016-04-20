 class Listing < ActiveRecord::Base
    belongs_to :user
    has_many :reservations
    mount_uploader :image, ImageUploader
    include PgSearch
    multisearchable :against => [:city, :address, :description]
end
