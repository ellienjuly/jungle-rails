require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # happy path
    it 'should be valid when given appropriate parameters' do
      @category = Category.create(name: 'example')
      @product = Product.new(category: @category, name: 'something', price: 1, quantity: 1)

      expect(@product.valid?).to be true
    end
  
      it 'should be invalid when given invalid name parameters' do
        @category = Category.create(name: 'example')
        @product = Product.new(category: @category, price: 1, quantity: 1)

        expect(@product.valid?).to be false
      
    end

    it 'should be invalid when given invalid price parameters' do
        @category = Category.create(name: 'example')
        @product = Product.new(category: @category, name: 'test', quantity: 1)
        
        expect(@product.valid?).to be false
      
    end

    it 'should be invalid when given invalid quantity parameters' do
        @category = Category.create(name: 'example')
        @product = Product.new(category: @category, name: 'test', price: nil, quantity: 1)

        expect(@product.valid?).to be false
      
    end

    it 'should be invalid when given invalid category parameters' do
        @category = Category.create(name: 'example')
        @product = Product.new(category: nil, name:'test', price: 1, quantity: 1)

        expect(@product.valid?).to be false
      
    end
  end
end
