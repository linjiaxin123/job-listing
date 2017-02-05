class JobsController < ApplicationController
  before_filter :authenticate_user! , only: [:new, :edit, :create, :update, :destroy, :favorite]
  before_action :validate_search_key, only: [:search]
  before_action :validate_city_key, only: [:city]

  def index
    @jobs = case params[:order]
    when 'by_lower_bound'
      Job.published.order('wage_lower_bound DESC').paginate(:page => params[:page], :per_page => 9)
    when 'by_upper_bound'
      Job.published.order('wage_upper_bound DESC').paginate(:page => params[:page], :per_page => 9)
    else
      Job.published.recent.paginate(:page => params[:page], :per_page => 9)
    end
  end

  def show
    @job = Job.find(params[:id])

    if @job.is_hidden
      flash[:warning] = "This Job already archieved"
      redirect_to root_path
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to jobs_path
    else
      render :new
    end
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to jobs_path, notice: "Update Success"
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    flash[:alert] = "Group deleted"
    redirect_to jobs_path
  end

  def search
    if @query_string.present?
      search_result = Job.published.ransack(@search_criteria).result(:distinct => true)
      @jobs = search_result.paginate(:page => params[:page], :per_page => 6 )
    end
  end

  def favorite
    @job = Job.find(params[:id])
    type = params[:type]
    if type == "favorite"
      current_user.favorite_jobs << @job
      redirect_to :back
    elsif type == "unfavorite"
      current_user.favorite_jobs.delete(@job)
      redirect_to :back
    else
      redirect_to :back
    end
  end

  def city
    if @cuery_string.present?
      city_result = Job.published.ransack(@city_criteria).result(:distinct => true)
      @jobs = city_result.paginate(:page => params[:page], :per_page => 6 )
    end
  end

  protected

  def validate_search_key
    @query_string = params[:q].gsub(/\\|\'|\/|\?/, "")
    if params[:q].present?
      @search_criteria =  {title_or_company_name_or_place_cont: @query_string}
    end
  end

  def search_criteria(query_string)
    { :title_cont => query_string }
  end

  def validate_city_key
    @cuery_string = params[:c].gsub(/\\|\'|\/|\?/, "")
    if params[:c].present?
      @city_criteria =  {place_cont: @cuery_string}
    end
  end

  def city_criteria(cuery_string)
    { :title_cont => cuery_string}
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :wage_upper_bound, :wage_lower_bound, :contact_email, :is_hidden, :place, :company_name, :recruitment_number)
  end

end
