class RecipeController < ApplicationController

  def index
    @categories = Category.where('featured_index not null').order('featured_index asc')
  end

  def show
    @recipe = Recipe.find_by_key(params[:key])
    unless @recipe
      flash[:error] = 'Invalid recipe key'
      redirect_to action: :index
    end
  end

  def create
    @recipe = Recipe.new
    @categories = Category.all.order('name asc').collect{|cat| [cat.name, cat.id]}

    if request.post?
      r = params[:recipe]
      @recipe.name = r[:name]
      @recipe.key = @recipe.name.gsub(' ', '_').downcase
      @recipe.category = Category.find_by_id(r[:category_id])
      @recipe.description = r[:description]
      @recipe.image = r[:image]

      if r[:directions]
        r[:directions].values.each do |direction|
          next if direction[:description].blank?
          @recipe.directions.build(direction)
        end
      end

      if r[:ingredients]
        r[:ingredients].values.each do |ingredient|
          next if ingredient[:quantity].blank?
          @recipe.ingredients.build(ingredient)
        end
      end

      if @recipe.save
        flash[:notice] = 'Successfully created recipe'
        redirect_to :action => :show, :key => @recipe.key
      else
        flash[:notice] = 'Failed to save recipe'
      end
    end
  end

  def update
    @recipe = Recipe.find_by_key(params[:key])
    unless @recipe
      flash[:error] = 'Invalid recipe key'
      redirect_to action: :index
    end

    if request.post?
      # redirect_to(action: 'show', key: @recipe.key)
    end
  end


end
