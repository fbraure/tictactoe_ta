class Case < ApplicationRecord
  #TODO ajout d'un Game Id pour jeux en parallèle
  def self.reset
    Case.all.each{|current_case| current_case.update(value: 0)}
  end
end
