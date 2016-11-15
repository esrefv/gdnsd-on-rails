class CreateSoas < ActiveRecord::Migration[5.0]
  def change
    create_table :soas do |t|
      t.references :domain, foreign_key: true
      t.string :nameserver1
      t.string :nameserver2
      t.string :email
      t.integer :serial_number
      t.string :refresh, default: "3H"
      t.string :retry, default: "5m"
      t.string :expire, default: "1w"
      t.integer :ttl_default, default: 86400
      t.string :ttl_min, default: "3h"

      t.timestamps
    end
  end
end
