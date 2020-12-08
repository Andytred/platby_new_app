class AddCategoryToIncomes < ActiveRecord::Migration[6.0]
  def change
    add_column :incomes, :category, :string
  end
end
