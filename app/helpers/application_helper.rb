module ApplicationHelper
  def format_currency(price_in_cents)
    number_to_currency(price_in_cents / 100)
  end
end
