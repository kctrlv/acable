class HomeController < ApplicationController
  before_action :require_visitor
  
  def show
    @user = User.new
  end
end
