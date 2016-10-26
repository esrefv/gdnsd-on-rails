module ApplicationHelper

def flash_class(level)
    case level
    when :notice then "info"
    when :success then "success"
    when :error then "warning"
    when :alert then "danger"
    else "danger"
    end
end

end
