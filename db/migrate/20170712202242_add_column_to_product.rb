class AddColumnToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :sale, :boolean
    add_column :products, :sale_amount, :integer
  end
end
