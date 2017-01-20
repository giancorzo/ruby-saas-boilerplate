class CreateJobPositions < ActiveRecord::Migration
  def change
    create_table :job_positions do |t|
      t.references :account, index: true, foreign_key: true
      t.boolean :status, default: true
      t.string :title
      t.text :mission_statement

      t.timestamps null: false
    end
  end
end
