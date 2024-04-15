class ChangeColumName < ActiveRecord::Migration[7.1]
  def change
    rename_column :recursos, :title, :titulo
  end
end
