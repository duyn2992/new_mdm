# frozen_string_literal: true

class BulkEmailJob < ApplicationJob
  queue_as :mailers
  BATCH_SIZE = 1000

  def perform
    total_sent = 0

    User.find_in_batches(batch_size: BATCH_SIZE) do |users|
      # users.each { |user| UserMailer.bulk_email(user).deliver_later }
      total_sent += users.size
      Rails.logger.info "Sent emails to #{total_sent} users."
      sleep 0.5
    end

    Rails.logger.info "Finished sending emails to #{total_sent} users."
  end
end
