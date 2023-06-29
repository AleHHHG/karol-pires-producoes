module ApplicationHelper
  include Pagy::Frontend

  def link_icon(url, css_class, icon, text)
    "<a href='#{url}' class='#{css_class}'><i class='#{icon}'></i> #{text} </a>".html_safe
  end

  def text_with_breackline(text)
    return '' if text.nil?
    text.gsub(/\n/, '<br />').html_safe
  end

  def format_date(date, format = '%d/%m/%Y')
    date.strftime(format)
  end

  def build_file_name(file)
    "<i class='fa-solid #{file_icon(file.content_type)}'></i> #{file.filename}".html_safe
  end

  private

  def file_icon(content_type)
    if content_type.include?('pdf')
      icon = 'fa-file-pdf'
    elsif content_type.include?('image')
      icon = 'fa-file-image'
    elsif content_type.include?('zip')
      icon = 'fa-file-zipper'
    elsif content_type.include?('spreadsheetml')
      icon = 'fa-file-excel'
    else
      icon = 'fa-file'
    end
    icon
  end
end
