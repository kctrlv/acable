class AddStatusToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :status, :text, default: nil
  end
end
