class GamesController < ApplicationController
  before_action :require_user

  def index
    @user = current_user
    @online_users = User.where(status: 'online')
  end
end
