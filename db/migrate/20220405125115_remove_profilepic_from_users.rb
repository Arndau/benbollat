class RemoveProfilepicFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :profilepic, :string
  end
end
