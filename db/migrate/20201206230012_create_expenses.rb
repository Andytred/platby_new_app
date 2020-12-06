class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.string :title
      t.text :description
      t.integer :vydaj
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
