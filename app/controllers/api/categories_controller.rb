class Api::CategoriesController < Api::BaseController
  def index
    @categories = Category.all
    render json: {status: 200, categories: @categories.map(&:name).join(", ")}
  end
end
