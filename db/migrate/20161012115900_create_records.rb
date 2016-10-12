class CreateRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :records do |t|
      t.references :domain, foreign_key: true
      t.string :name
      t.integer :type
      t.string :content
      t.integer :ttl
      t.integer :prio

      t.timestamps
    end
  end
end
