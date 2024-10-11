class CreateBibliotecas < ActiveRecord::Migration[7.2]
  def change
    create_table :bibliotecas do |t|
      t.string :nombre
      t.string :estado
      t.references :libro, null: false, foreign_key: true
      t.references :autor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
