class CasesController < ApplicationController
  def update
    my_case = Case.find(params[:id])
    if my_case.value == 0
      if current_user.nickname == "computer"
        my_case.value = -1
      else
        my_case.value = 1
      end
    end
    my_case.save
    redirect_to root_path
  end
end
