module ApplicationHelper
  include Pagy::Frontend
  
  def build_alert_classes(alert_type)
    classes = ' '
    case alert_type.to_sym
    when :alert, :danger, :error, :validation_errors
      classes += 'error'
    when :warning, :todo
      classes += 'warning'
    when :notice, :success
      classes += 'success'
    end
  end
end
