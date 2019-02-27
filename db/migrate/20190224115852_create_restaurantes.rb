class CreateRestaurantes < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurantes do |t|
      t.string :name
      t.text :description
      t.timestamp
    end
  end
end
