class SearchController < ApplicationController
  def index

  end

  # def live_search
  #   @search_phrase = "%" + params[:query] + '%'
  #   @results = Product.find(:all, :conditions => ["Description like ? ", @search_phrase])
  #   render :layout => false
  # end
end
