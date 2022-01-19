class UsersController < ActionController::Base

  def withdraw_money
    user = User.find(params[:id])
    @result = WithdrawMoneyService.call(user, user_params[:amount])
  end

  private

  def user_params
    params.require(:user).permit(:amount)
  end

end
