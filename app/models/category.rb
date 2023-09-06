# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :inventories
  has_many :products, through: :inventories

  validates :name, presence: { message: 'Please enter name' },
                   uniqueness: { message: 'Exist' }

  before_save :capitalize_name

  def capitalize_name
    self.name = name.capitalize
  end
end
