class ProductsController < ApplicationController
before_action :find_product, only: [:edit, :destroy, :show, :update]

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.category = Category.find(params[:category_id])
    @product.subcategory = Subcategory.find(params[:subcategory_id])

    if @product.save
      flash[:notice] = "Product created successfully"
      redirect_to new_product_review_path(product_id: @product)
    else
      flash[:alert] = "Problem creating your product"
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :brand, :ratings, {images: []})
  end

  def find_product
  @product = Product.find params[:id]
  end



end
