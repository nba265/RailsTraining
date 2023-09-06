# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :inventories
  has_many :categories, through: :inventories

  validates :name, presence: { message: 'Please enter name' }
  validates :price, presence: { message: 'Please enter price' }

  def mark_of_out_stock
    if inventories.sum(:stock) < 5
      update(out_of_stock: true)
    else
      update(out_of_stock: false)
    end
  end
end
