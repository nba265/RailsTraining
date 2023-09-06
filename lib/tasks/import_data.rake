# frozen_string_literal: true

namespace :import do
  desc 'Import data into product'
  task data_product: :environment do
    ('A'..'Z').each do |i|
      product = Product.new(name: "Nguyen Van #{i}", price: rand(10.0..100.0))
      if product.save
        puts 'Data imported successfully.'
      else
        puts "Error importing data: #{product.errors.full_messages.join(', ')}"
      end
    end
  end

  desc 'Import data into category'
  task data_category: :environment do
    (1..7).each do |i|
      category = Category.new(name: "Category #{i}")
      if category.save
        puts 'Data imported successfully.'
      else
        puts "Error importing data: #{category.errors.full_messages.join(', ')}"
      end
    end
  end

  desc 'Import data into inventory'
  task data_inventory: :environment do
    (1..50).each do |_|
      inventory = Inventory.new(product_id: rand(1..30), category_id: rand(1..7), stock: rand(1..30))
      if inventory.save
        puts 'Data imported successfully.'
      else
        puts "Error importing data: #{inventory.errors.full_messages.join(', ')}"
      end
    end
  end
end
