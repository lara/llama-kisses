class RedemptionsController < ApplicationController
  def new
    @redemption = Redemption.new
  end

  def create
    @redemption = Redemption.create!(redemtion_params)
  end

  private

  def redemtion_params
    params.require(:redemption).permit(:kisses_redeemed)
  end
end
