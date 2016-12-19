class DeleteDomainJob < ApplicationJob
  queue_as :default
  puts "DeleteDomainJob"

  def perform(textfilename)
    puts "Delete Perform içine girdi :D "
    GdnsdIo::FileOperations.new({filepath: APP_CONFIG['development_path']}).delete_text(textfilename)
  end
end
