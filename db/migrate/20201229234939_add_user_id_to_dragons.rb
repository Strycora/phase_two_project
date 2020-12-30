class AddUserIdToDragons < ActiveRecord::Migration
  def change
    add_column :dragons, :user_id, :integer
  end
end
