class AddHostToGame < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :host_id, :integer, default: nil
  end
end
