# frozen_string_literal: true

class UserImportJob < ApplicationJob
  queue_as :data_processing
  BATCH_SIZE = 1000

  def perform(file_path)
    batch = []
    total_records = 0

    CSV.foreach(file_path, headers: true) do |row|
      batch << row.to_h
      total_records += 1

      if batch.size >= BATCH_SIZE
        ActiveRecord::Base.transaction do
          User.insert_all(batch)
        end
        Rails.logger.info "Imported #{total_records} records."
        batch.clear

        sleep 0.5
      end
    end

    ActiveRecord::Base.transaction do
      User.insert_all(batch) if batch.any?
    end

    Rails.logger.info "Finished importing #{total_records} records."
  end
end
