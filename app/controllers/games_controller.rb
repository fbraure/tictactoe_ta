class GamesController < ApplicationController
  def create
    winner = nil
    winner = User.find(params[:winner]) if params[:winner].present?
    # TODO Il n'est pas sensé être nil en fin de dev
    unless winner.nil?
      game = Game.new(user: winner)
      game.save
    end
    Case.reset
    redirect_to root_path
  end
end
