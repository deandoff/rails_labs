module ApplicationHelper
  def full_title(page_title = '')
    base_title = "Akhmetgaleev Islam"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
end
