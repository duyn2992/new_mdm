# frozen_string_literal: true

module NotificationService
  def send_notification(resource, action)
    # Todo implement logic
    Rails.logger.info "Notification sent! #{resource.class.name}##{resource.id} on #{action}."
  end
end
