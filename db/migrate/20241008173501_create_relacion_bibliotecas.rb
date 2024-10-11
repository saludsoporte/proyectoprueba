class CreateRelacionBibliotecas < ActiveRecord::Migration[7.2]
  def change
    create_table :relacion_bibliotecas do |t|
      t.references :biblioteca, null: false, foreign_key: true
      t.references :libro, null: false, foreign_key: true

      t.timestamps
    end
  end
end
