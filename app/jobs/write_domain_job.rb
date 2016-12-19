class WriteDomainJob < ApplicationJob
  queue_as :default

  def perform(domain_id,textfilename)
    @soas = Soa.where(domain_id: domain_id)
    @records = Record.where(domain_id: domain_id)
    GdnsdIo::FileOperations.new({filepath: APP_CONFIG['development_path']}).write_soa_record(@soas, @records, textfilename)
  end
end
