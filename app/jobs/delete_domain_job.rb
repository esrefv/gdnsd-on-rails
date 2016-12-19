class DeleteDomainJob < ApplicationJob
  queue_as :default

  def perform(textfilename)
    GdnsdIo::FileOperations.new({filepath: APP_CONFIG['development_path']}).delete_text(textfilename)
  end
end
