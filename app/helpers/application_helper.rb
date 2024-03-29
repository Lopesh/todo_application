module ApplicationHelper
  def flash_class(level) 
    case level.to_s
        when "notice" then "alert alert-info"
        when "success" then "alert alert-success"
        when "error" then "alert alert-danger"
        when "alert" then "alert alert-error"
    end
  end
end
