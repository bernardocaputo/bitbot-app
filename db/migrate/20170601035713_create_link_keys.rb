class CreateLinkKeys < ActiveRecord::Migration[5.1]
  def change
    create_table :link_keys do |t|
      t.integer :link_id
      t.integer :key_id
    end
  end
end
