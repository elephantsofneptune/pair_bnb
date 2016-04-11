 class Listing < ActiveRecord::Base
    belongs_to :user
    has_many :reservations

    #include Elasticsearch::Model::Search
   #include Elasticsearch::Model::Callbacks
end
