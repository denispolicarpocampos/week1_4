class SearchesController < ApplicationController
   
  def index
    if params[:search_text].present?
      search_result
    else
      flash[:alert] = "Please enter something to search"
      redirect_back fallback_location: root_path
    end
  end

  private

  def search_result
    disabled_users = User.where("deleted_at IS NOT NULL").any? ? User.where("deleted_at IS NOT NULL").ids : []
    @results = PgSearch.multisearch(params[:search_text])
                       .where.not("(searchable_type = 'User' AND searchable_id IN (?))", 
                                  disabled_users << current_user.id)
                       .order("created_at DESC")
  end

end
