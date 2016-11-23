class GamesController < ApplicationController
  before_action :require_user

  def index
    @user = current_user
    @online_users = User.where(status: 'online')
    @games = Game.where(status: 'online')
  end

  # def new
  #   @game = Game.create(host_id: current_user.id)
  # end
end
