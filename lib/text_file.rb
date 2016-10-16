class FileProcess

  def create_file_for_domain(text_file_name, domain_id)
    tmp_file = File.new("./text/" + text_file_name + ".txt", "w+")
    @records = Record.where(domain_id: domain_id)
    if @records.length > 0
      @records.each do |record|
        if record.prio.exist?
          tmp_file.puts(record.name + "\t" + record.rtype + "\t" + record.content + "\t" + record.ttl)
        else
          tmp_file.puts(record.name + "\t" + record.rtype + "\t" + record.content + "\t" + record.ttl + "\t" + record.prio)
        end
      end
    end
    tmp_file.close
  end

  def create_file_for_record(domain_id)
    tmp_text_file_name = Domain.where(id: domain_id).name
    tmp_file = File.new("./text/" + tmp_text_file_name + ".txt", "w+")

    @records = Record.where(domain_id: domain_id)
    @records.each do |record|
      if record.prio.exist?
        tmp_file.puts(record.name + "\t" + record.rtype + "\t" + record.content + "\t" + record.ttl)
      else
        tmp_file.puts(record.name + "\t" + record.rtype + "\t" + record.content + "\t" + record.ttl + "\t" + record.prio)
      end
    end
    tmp_file.close
  end

  def delete_file(text_file_name)
    File.delete( "./text/" + text_file_name + ".txt")
  end
end