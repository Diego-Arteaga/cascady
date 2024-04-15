class CreateUbicacions < ActiveRecord::Migration[7.1]
  def change
    create_table :ubicacions do |t|
      t.string :calle
      t.string :numero
      t.string :cp
      t.text :descripcion
      t.references :cliente, null: false, foreign_key: true

      t.timestamps
    end
  end
end
