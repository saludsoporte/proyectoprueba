class CreateLibros < ActiveRecord::Migration[7.2]
  def change
    create_table :libros do |t|
      t.string :nombre
      t.string :editorial
      t.date :fechaPub
      t.references :autor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
