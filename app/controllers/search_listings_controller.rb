class SearchListingsController < ApplicationController

	def autocomplete
    render json: Book.search(params[:query], {
      fields: ["title^5", "author"],
      limit: 10,
      load: false,
      misspellings: {below: 5}
    }).map(&:title)
  end

end
