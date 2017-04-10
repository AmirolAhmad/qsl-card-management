module ApplicationHelper
  def check_status(obj)
    case obj.status
    when "pending"
      "<span class='label label-warning'>#{obj.status}</span>".html_safe
    else
      "<span class='label label-primary'>#{obj.status}</span>".html_safe
    end
  end

end
