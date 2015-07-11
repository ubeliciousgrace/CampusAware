class ReportsController < ApplicationController

  def index
  end

  def new
    @report = Report.new
  end

  def create
    @report = Report.create(report_params)
    lat = @report.convert_to_latlng["lat"]
    long = @report.convert_to_latlng["lng"]
    @report.update(user_id: current_user.id, lat: lat, long: long)
    redirect_to reports_path
  end




  private

  def report_params
    params.require(:report).permit(:title, :description, :street_number, :street_name, :city, :state, :zip_code)
  end

end
