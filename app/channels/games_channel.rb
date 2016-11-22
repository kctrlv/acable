# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class GamesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "games_channel"
  end

  def connect_user
    current_user.connect
  end

  def unsubscribed
    current_user.disconnect
  end
end
