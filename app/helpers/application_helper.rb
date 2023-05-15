module ApplicationHelper
  include Pagy::Frontend
  def link_icon(url, css_class, icon, text)
    "<a href='#{url}' class='#{css_class}'><i class='#{icon}'></i> #{text} </a>".html_safe
  end
end
