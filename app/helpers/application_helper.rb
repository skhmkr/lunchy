module ApplicationHelper
  def title
    base_title = "Lunchy"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{title}"
     end
  end
end
