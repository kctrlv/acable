class Game < ApplicationRecord
  has_many :players, class_name: "User", foreign_key: "game_id"
end
