module DeviseHelper
  def devise_error_messages!
    return "" if resource.errors.empty?

    html = <<-HTML
    <div class="alert alert-danger" id="flash_alert">
      #{resource.errors.full_messages.join}
    </div>
    HTML

    html.html_safe
  end
end
