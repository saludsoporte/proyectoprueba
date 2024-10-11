class CreateAutors < ActiveRecord::Migration[7.2]
  def change
    create_table :autors do |t|
      t.string :nombre
      t.integer :telefono
      t.string :titulo

      t.timestamps
    end
  end
end
