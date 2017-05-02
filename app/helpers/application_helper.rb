module ApplicationHelper
  def active_menu path
    return "active" if current_page?(path)
  end
end
