# frozen_string_literal: true

class ProductsController < ApplicationController
  load_and_authorize_resource
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update; end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  protected

  def product_params
    params.require(:product).permit(:title, :description, :color, :fabric)
  end
end
