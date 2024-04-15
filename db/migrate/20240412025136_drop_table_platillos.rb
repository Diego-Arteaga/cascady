class DropTablePlatillos < ActiveRecord::Migration[7.1]
  def change
    drop_table :platillos
  end
end
