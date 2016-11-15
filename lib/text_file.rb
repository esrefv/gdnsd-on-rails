class FileProcess
  def initialize
    @gdnsd = GdnsdIo::FileOperations.new({filepath: APP_CONFIG['development_path']})
  end

  def create_file_for_domain(text_file_name, domain_id)
    @gdnsd.create_text(text_file_name)
    write_records_create_file(domain_id, text_file_name)
  end

  def create_file_for_record(domain_id)
    tmp_text_file_name = Domain.find(domain_id).name
    write_records_create_file(domain_id, tmp_text_file_name)
  end

  def delete_file(text_file_name)
    @gdnsd.delete_text(text_file_name)
  end

  private

  def write_records_create_file (domain_id, text_file_name)
    @records = Record.where(domain_id: domain_id)
    @gdnsd.write_record(@records, text_file_name)
  end
end