class SearchesController < ApplicationController
   
  def index
    if params[:search_text].present?
      search_result
    else
      flash[:alert] = "Please, enter a value to search"
      redirect_back fallback_location: root_path
    end
  end


  private


  def search_result
    @results = PgSearch.multisearch(params[:search_text]).where.not("(searchable_type = 'User' AND searchable_id = ?)", current_user.id)
                       .order("created_at DESC")
  end

end
