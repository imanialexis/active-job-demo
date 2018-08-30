class ReminderJob < ApplicationJob
  queue_as :default

  def perform(*books)
    # Do something later
   puts 'Back up reminder'
  end
end
