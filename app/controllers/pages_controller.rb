class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @user = current_user
    @games = Game.all
    @games_won = Game.where(user: @user)
    @cases = Case.all.order(row: :asc).order(col: :asc)
    # @case_test= Case.first
    @winner = checkWinner
  end

  private

  def getComputerNextId
    Case.where(value: 0).sample.id
  end

  def getCases
    # TODO pour éviter de s'arreter que si la grille est toute remplie
    cases = []
    cases << Case.where("row=0 AND col=0")[0]||nil
    cases << Case.where("row=0 AND col=1")[0]||nil
    cases << Case.where("row=0 AND col=2")[0]||nil
    cases << Case.where("row=1 AND col=0")[0]||nil
    cases << Case.where("row=1 AND col=1")[0]||nil
    cases << Case.where("row=1 AND col=2")[0]||nil
    cases << Case.where("row=2 AND col=0")[0]||nil
    cases << Case.where("row=2 AND col=1")[0]||nil
    cases << Case.where("row=2 AND col=2")[0]||nil
    return cases
  end

  def checkWinner
    # cases = Case.where("value != 0")
    cases = getCases
    # end of game
    # if cases.count == 9
      # User pose value = 1
      if cases[0].value + cases[1].value + cases[2].value == 3 \
        || cases[3].value + cases[4].value + cases[5].value == 3 \
        || cases[6].value + cases[7].value + cases[8].value == 3 \
        || cases[0].value + cases[3].value + cases[6].value == 3 \
        || cases[1].value + cases[4].value + cases[7].value == 3 \
        || cases[2].value + cases[5].value + cases[8].value == 3 \
        || cases[0].value + cases[4].value + cases[8].value == 3 \
        || cases[2].value + cases[4].value + cases[6].value == 3
          return current_user
      # Computer pose value = -1
      elsif cases[0].value + cases[1].value + cases[2].value == -3 \
        || cases[3].value + cases[4].value + cases[5].value == -3 \
        || cases[6].value + cases[7].value + cases[8].value == -3 \
        || cases[0].value + cases[3].value + cases[6].value == -3 \
        || cases[1].value + cases[4].value + cases[7].value == -3 \
        || cases[2].value + cases[5].value + cases[8].value == -3 \
        || cases[0].value + cases[4].value + cases[8].value == -3 \
        || cases[2].value + cases[4].value + cases[6].value == -3
          return User.find_by(nickname: "computer")
      end
    # end
    # pas de gagnant computer coche au hasard Sauf si personne n'a coché de case
    unless Case.where("value != 0").count == 0
      next_id = getComputerNextId
      my_case = Case.find(next_id)
      my_case.update(value: -1)
    end
    return nil
  end
end
