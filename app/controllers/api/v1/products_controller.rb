class Api::V1::ProductsController < ApplicationController
  def index
    products = Product.all

    HardWorker.perform_async("Junior", 3)
    MessageWorker.perform_async("Jr", 5)

    render json: products
  end

  def create
    product = Product.new(
      name: params[:name],
      price: params[:price]
    )

    if product.save
      render json: product
    else
      render json: product.errors, status: :unprocessable_entity
    end
  end
end
