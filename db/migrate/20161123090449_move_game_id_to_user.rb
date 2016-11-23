class MoveGameIdToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :game_id, :integer, default: nil
    remove_column :games, :host_id, :integer
  end
end
