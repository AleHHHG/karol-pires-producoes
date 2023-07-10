# frozen_string_literal: true

class OrderChartService
  attr_reader :initial_date, :end_date

  def initialize(initial_date = DateTime.now.beginning_of_month, end_date = DateTime.now.end_of_month)
    @initial_date = initial_date
    @end_date = end_date
  end

  def bar_chart_data
    items = Order.by_period(initial_date, end_date).joins(:project).group('projects.name').order('projects.name desc').count
    { labels: items.keys, values: items.values}
  end

  def pie_chart_data
    items = Order.by_period(initial_date, end_date).select('projects.name as project_name, sum(price) as price')
                 .grouped_by_project.order('projects.name desc')
    { labels: items.map(&:project_name), values: items.map(&:price) }
  end
end
