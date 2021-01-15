class AddImageToGerendes < ActiveRecord::Migration[6.0]
  def change
    add_column :gerendes, :image, :string
  end
end
