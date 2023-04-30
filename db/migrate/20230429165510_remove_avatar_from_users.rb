class RemoveAvatarFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :avatar, :attachment
  end
end
