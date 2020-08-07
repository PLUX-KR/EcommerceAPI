module Sellers
  class ProductsController < BaseController
    before_action :set_product, only: %i[show]

    def index
      @products = Product.all.limit(10)
      # = index.json.jbuilder
    end

    def show
      # = show.json.jbuilder
    end

    def search
      @products = Product.ransack(params[:query]).result
    end

    def category
      @products = Product.joins(:categories).ransack(params[:query]).result
    end

    private

    def set_product
      @product = Product.find(params[:id])
    end
  end
end
