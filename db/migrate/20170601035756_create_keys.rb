class CreateKeys < ActiveRecord::Migration[5.1]
    def change
      create_table :keys do |t|
        t.string :name
        t.integer :key_id
        t.integer :company_id
      end
    end
  end
