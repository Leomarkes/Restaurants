class AddColumnToRestaurantes < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurantes, :image, :string
  end
end
