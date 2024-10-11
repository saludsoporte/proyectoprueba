class ModificarTablas < ActiveRecord::Migration[7.2]
  def change
    remove_column :bibliotecas, :libro_id, :bigint
    remove_column :bibliotecas, :autor_id, :bigint
    change_column :autors, :telefono, :string
    add_column :libros, :condicion, :string, :default => "nuevo"
    add_column :autors, :pais, :string
  end
end
