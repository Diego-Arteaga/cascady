class RemoveColumnFromProductos < ActiveRecord::Migration[7.1]
  def change
    remove_column :productos, :img, :string
  end
end
