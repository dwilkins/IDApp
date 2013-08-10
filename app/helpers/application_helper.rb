module ApplicationHelper

  def primary_nav_element(text, link, section)
    content_tag(:li, class: (section.include? controller.controller_name) ? 'active' : nil) do
      link_to text, link
    end
  end


end
