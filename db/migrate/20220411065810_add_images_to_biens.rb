class AddImagesToBiens < ActiveRecord::Migration[6.1]
  def change
    add_column :biens, :images, :string, array: true, default: []
  end
end
