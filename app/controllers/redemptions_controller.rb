class RedemptionsController < ApplicationController
  def new
    @redemption = Redemption.new
  end

  def create
    @redemption = current_user.redemptions.new(redemption_params)

    unless @redemption.save
      render :new
    end
  end

  private

  def redemption_params
    params.require(:redemption).permit(:kisses_redeemed)
  end
end
