class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def broadcast(room = 'games_channel', data)
    ActionCable.server.broadcast(room, data)
  end
end
