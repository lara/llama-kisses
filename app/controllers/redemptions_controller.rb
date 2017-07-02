class RedemptionsController < ApplicationController
  def new
    @redemption = Redemption.new
  end

  def create
    @redemption = Redemption.new(redemtion_params)

    unless @redemption.save
      render :new
    end
  end

  private

  def redemtion_params
    params.require(:redemption).permit(:kisses_redeemed)
  end
end
