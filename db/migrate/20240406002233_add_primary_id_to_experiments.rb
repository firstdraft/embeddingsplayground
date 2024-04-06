class AddPrimaryIdToExperiments < ActiveRecord::Migration[7.1]
  def change
    add_reference :experiments, :primary, null: true, foreign_key: {to_table: :examples}
  end
end
