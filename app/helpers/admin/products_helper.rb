# frozen_string_literal: true

module Admin::ProductsHelper
  def is_admin
    return unless current_user

    current_user.is_admin?
  end

  def product_types
    [
      ['Do uong', 'Drink'],
      ['Do an', 'Food']
    ]
  end
end
