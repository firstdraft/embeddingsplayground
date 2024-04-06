class CreateExperiments < ActiveRecord::Migration[7.1]
  def change
    create_table :experiments do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
