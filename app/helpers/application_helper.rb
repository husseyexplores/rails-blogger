module ApplicationHelper
  def flash_toastr
    flash_messages = []
    flash.each do |type, message|
      type = 'info' if type == 'info'
      type = 'success' if type == 'notice'
      type = 'alert'   if type == 'warning'
      type = 'error' if type == 'error'
      type = 'error' if type == 'alert'
      text = "<script>toastr.#{type}(\"#{message}\");</script>"
      flash_messages << text.html_safe if message
    end
    flash_messages.join("\n").html_safe
  end
end
