class CreateRecursos < ActiveRecord::Migration[7.1]
  def change
    create_table :recursos do |t|
      t.string :title

      t.timestamps
    end
  end
end
