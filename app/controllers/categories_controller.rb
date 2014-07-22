class CategoriesController < ApplicationController
  # GET /categories/:id
  def show
    @category = Category.find(params[:id])
  end
end
