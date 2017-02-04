class FavoriteController < ApplicationController
  def index
    @jobs = current_user.favorite_jobs.paginate(:page => params[:page], :per_page => 9)
  end
end
