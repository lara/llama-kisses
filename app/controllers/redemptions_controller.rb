class RedemptionsController < ApplicationController
  def new
    @redemption = Redemption.new
    @nearest_llama_ranches = []

    if params[:search]
      @nearest_llama_ranches = LlamaRanch.near(params[:search])
    end
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
