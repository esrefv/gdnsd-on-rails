class FileProcess
  def initialize
    @directory_name = "text"
    Dir.mkdir(@directory_name) unless File.exists?(@directory_name)
  end

  def create_file_for_domain(text_file_name, domain_id)

    tmp_file = File.new("./" + @directory_name + "/" + text_file_name + ".txt", "w+")
    @records = Record.where(domain_id: domain_id)
    if @records.length > 0
      @records.each do |record|
        if record.prio.present?
          tmp_file.puts(record.name + "\t" + record.rtype + "\t" + record.content.to_s + "\t" + record.ttl.to_s)
        else
          tmp_file.puts(record.name + "\t" + record.rtype + "\t" + record.content.to_s + "\t" + record.ttl.to_s + "\t" + record.prio.to_s)
        end
      end
    end
    tmp_file.close
  end

  def create_file_for_record(domain_id)

    tmp_text_file_name = Domain.find(domain_id).name
    tmp_file = File.new("./" + @directory_name + "/" + tmp_text_file_name + ".txt", "w+")

    @records = Record.where(domain_id: domain_id)
    @records.each do |record|
      if record.prio.present?
        tmp_file.puts(record.name + "\t" + record.rtype + "\t" + record.content.to_s + "\t" + record.ttl.to_s)
      else
        tmp_file.puts(record.name + "\t" + record.rtype + "\t" + record.content.to_s + "\t" + record.ttl.to_s + "\t" + record.prio.to_s)
      end
    end
    tmp_file.close
  end

  def delete_file(text_file_name)
    File.delete( "./text/" + text_file_name + ".txt")
  end
end