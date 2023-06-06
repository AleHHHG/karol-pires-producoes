class DashboardController < ApplicationController

  # GET /dashboard
  def index
    order_chart = OrderChartService.new()
    @initial_date = order_chart.initial_date
    @end_date = order_chart.end_date
    @bar_chart_data = order_chart.bar_chart_data
    @pie_chart_data = order_chart.pie_chart_data
  end
end