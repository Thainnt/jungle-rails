require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validation' do

    it 'should be auto-assigned by Active Record for saved records' do
      @category = Category.new
      @category.save!

      @product = Product.new
      @product.name = "Multitool"
      @product.price_cents = 3047
      @product.quantity = 24
      @product.category_id = @category.id
      @product.save!

      expect(@product.id).to be_present
    end

    it 'should have name for a new product' do
      @category = Category.new
      @category.save!

      @product = Product.new
      @product.name = "Multitool"
      @product.price_cents = 3047
      @product.quantity = 24
      @product.category_id = @category.id
      @product.save!

      @product.errors.full_messages

      expect(@product.name).to be_present
    end

    it 'should have price for a new product' do
      @category = Category.new
      @category.save!

      @product = Product.new
      @product.name = "Multitool"
      @product.price_cents = 3047
      @product.quantity = 24
      @product.category_id = @category.id
      @product.save!

      expect(@product.name).to be_present
    end

    it 'should have quantity of a new product' do
      @category = Category.new
      @category.save!

      @product = Product.new
      @product.name = "Multitool"
      @product.price_cents = 3047
      @product.quantity = 24
      @product.category_id = @category.id
      @product.save!

      expect(@product.name).to be_present
    end

    it 'should have category of a new product' do
      @category = Category.new
      @category.save!

      @product = Product.new
      @product.name = "Multitool"
      @product.price_cents = 3047
      @product.quantity = 24
      @product.category_id = @category.id
      @product.save!

      expect(@product.category_id).to be_present
    end
  end
end