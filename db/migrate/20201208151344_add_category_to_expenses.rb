class AddCategoryToExpenses < ActiveRecord::Migration[6.0]
  def change
    add_column :expenses, :category, :string
  end
end
