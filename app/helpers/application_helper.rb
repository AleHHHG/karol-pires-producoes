module ApplicationHelper
  include Pagy::Frontend

  def link_icon(url, css_class, icon, text)
    "<a href='#{url}' class='#{css_class}'><i class='#{icon}'></i> #{text} </a>".html_safe
  end

  def text_with_breackline(text)
    text.gsub(/\n/, '<br />').html_safe
  end

  def format_date(date, format: '%d/%m/%Y')
    date.strftime(format)
  end
end
