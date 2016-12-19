class WriteRecordJob < ApplicationJob
  queue_as :default
  puts "WriteRecordJob"

  def perform(domain_id,textfilename)
    puts "Write Perform içine girdi :D "
    @records = Record.where(domain_id: domain_id)
    @soas = Soa.where(domain_id: domain_id)
    GdnsdIo::FileOperations.new({filepath: APP_CONFIG['development_path']}).write_soa_record(@soas, @records, textfilename)
  end
end
