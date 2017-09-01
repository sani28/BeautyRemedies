class ProductReviewsController < ApplicationController

  def new
    @product_review = ProductReview.new
    @product_id = params[:product_id]
  end


  def create
    @product_review = ProductReview.new(product_review_params)

    if @product_review.save
      redirect_to root_path
    end
  end


  private


  def product_review_params
    params.require(:product_review).permit(:rating, :product_id, :positive_comment, :negative_comment, {images: []})
  end
  #

  # def find_product_review
  # @product_review = ProductReview.find params[:id]
  # end

    # def product_review_params
    #   params.require(:product_review).permit(:positive_comment, :negative_comment, :name)
    # end

end
