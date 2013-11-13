class ReportsController < ApplicationController
  def index
    @reports = Report.all
  end

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(set_params)
    if @report.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @report = Report.find(params[:id])
  end

  def edit
  end

  def update
    @report = Report.find(params[:id])
    @report_start_date = params[:report][:start_date]
    @report_end_date = params[:report][:end_date]
    @reports = Listing.total_customers_by_date(@report_start_date, @report_end_date)
    render 'customers_by_date_report'
  end

private

  def set_params
    params.require(:report).permit(:report_name, :report_description)
  end

  def set_date_range_params
    params.require(:report).permit(:start_date, :end_date)
  end
end
