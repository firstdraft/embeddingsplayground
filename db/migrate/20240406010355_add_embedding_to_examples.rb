class AddEmbeddingToExamples < ActiveRecord::Migration[7.1]
  def change
    add_column :examples, :embedding, :vector, limit: 1536
  end
end
