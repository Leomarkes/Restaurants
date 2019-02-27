class CreateComentario < ActiveRecord::Migration[5.2]
  def change
    create_table :comentarios do |t|
      t.text :description
      t.integer :nota
      t.integer :restaurante_id
      t.integer :user_id
    end
  end
end
