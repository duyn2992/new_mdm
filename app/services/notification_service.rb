# frozen_string_literal: true

class NotificationService
  def self.send_notification(resource, action)
    message = {
      resource: resource.class.name,
      id: resource.id,
      action:,
      message: "#{resource.class.name} ##{resource.id} was #{action}"
    }

    ActionCable.server.broadcast("notifications", message)

    Rails.logger.info "Notification sent! #{resource.class.name}##{resource.id} on #{action}."
  end
end
