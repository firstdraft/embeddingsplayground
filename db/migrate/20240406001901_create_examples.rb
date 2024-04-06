class CreateExamples < ActiveRecord::Migration[7.1]
  def change
    create_table :examples do |t|
      t.references :experiment, null: false, foreign_key: true
      t.text :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
