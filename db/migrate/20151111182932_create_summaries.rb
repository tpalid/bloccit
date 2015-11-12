class CreateSummaries < ActiveRecord::Migration
  def change
    create_table :summaries do |t|
      t.text :description
      t.integer :post_id

      t.timestamps null: false
    end
    add_index :summaries, :post_id
  end
end
