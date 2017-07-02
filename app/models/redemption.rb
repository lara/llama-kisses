class Redemption < ApplicationRecord
  belongs_to :user
  validate :kiss_count_cannot_exceed_available_kisses, on: :create

  private

  def kiss_count_cannot_exceed_available_kisses
    return unless kiss_count_exceeds_available_kisses?

    errors.add :kiss_count, "cannot be more than the kisses you have purchased"
  end

  def kiss_count_exceeds_available_kisses?
    kisses_redeemed > available_kisses
  end

  def available_kisses
    user.remaining_kisses
  end
end
