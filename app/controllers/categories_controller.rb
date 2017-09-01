class CategoriesController < ApplicationController


  def sub_categories_listing
    category = Category.find(params[:id])
    render json: category.subcategories
  end



end
