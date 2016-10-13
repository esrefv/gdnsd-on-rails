class RenameColumnInRecords < ActiveRecord::Migration[5.0]
  def change
    rename_column :records, :record_type, :rtype
  end
end
