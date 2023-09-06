# frozen_string_literal: true

class Inventory < ApplicationRecord
  belongs_to :product
  belongs_to :category

  scope :products_in_category, lambda { |category_id|
    joins(:product).where(inventories: { category_id: }).map(&:product)
  }
end
