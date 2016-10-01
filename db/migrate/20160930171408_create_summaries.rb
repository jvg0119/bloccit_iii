class CreateSummaries < ActiveRecord::Migration[5.0]
  def change
    create_table :summaries do |t|
      t.text :body
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
