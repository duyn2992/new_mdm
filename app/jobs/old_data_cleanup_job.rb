# frozen_string_literal: true

class OldDataCleanupJob < ApplicationJob
  queue_as :data_processing

  def perform
    # Todo logic
  end
end
