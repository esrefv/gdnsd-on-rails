class FileProcess
  def initialize
    @gdnsd = GdnsdIo::FileOperations.new({filepath: APP_CONFIG['development_path']})
  end

  def create_file_for_domain(text_file_name, domain_id)
    write_records_create_file(domain_id, text_file_name)
  end

  def create_file_for_record(domain_id)
    tmp_text_file_name = Domain.find(domain_id).name
    write_records_create_file(domain_id, tmp_text_file_name)
  end

  def delete_file(text_file_name)
    #@gdnsd.delete_text(text_file_name)
    DeleteDomainJob.perform_later(text_file_name)
  end

  private

  def write_records_create_file (domain_id, text_file_name)
    @records = Record.where(domain_id: domain_id)
    @soas = Soa.where(domain_id: domain_id)
    #@gdnsd.write_soa_record(@soas, @records, text_file_name)
    WriteRecordJob.perform_later(domain_id,text_file_name)
  end
end