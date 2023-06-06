class DashboardController < ApplicationController

  # GET /dashboard
  def index
    if params[:initial_date].present?
      order_chart = OrderChartService.new(DateTime.parse(params[:initial_date]), DateTime.parse(params[:end_date]).end_of_day)
    else
      order_chart = OrderChartService.new
    end
    @initial_date = order_chart.initial_date
    @end_date = order_chart.end_date
    @bar_chart_data = order_chart.bar_chart_data
    @pie_chart_data = order_chart.pie_chart_data
  end
end