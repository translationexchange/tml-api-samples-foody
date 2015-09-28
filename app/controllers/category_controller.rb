class CategoryController < ApplicationController

  def show
    @category = Category.find_by_key(params[:key])
    unless @category
      flash[:error] = 'Invalid category key'
      redirect_to root_url
    end
  end

end
