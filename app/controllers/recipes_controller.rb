#--
# Copyright (c) 2016 Translation Exchange, Inc.
#
#
#  _______                  _       _   _             ______          _
# |__   __|                | |     | | (_)           |  ____|        | |
#    | |_ __ __ _ _ __  ___| | __ _| |_ _  ___  _ __ | |__  __  _____| |__   __ _ _ __   __ _  ___
#    | | '__/ _` | '_ \/ __| |/ _` | __| |/ _ \| '_ \|  __| \ \/ / __| '_ \ / _` | '_ \ / _` |/ _ \
#    | | | | (_| | | | \__ \ | (_| | |_| | (_) | | | | |____ >  < (__| | | | (_| | | | | (_| |  __/
#    |_|_|  \__,_|_| |_|___/_|\__,_|\__|_|\___/|_| |_|______/_/\_\___|_| |_|\__,_|_| |_|\__, |\___|
#                                                                                        __/ |
#                                                                                       |___/
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#
#-- ::RecipesController Routing Information
#
#  get       /                                   => index
#  get       /recipes/:id/delete                 => delete
#  post      /recipes                            => create
#  get       /recipes/new                        => new
#  get       /recipes/:id/edit                   => edit
#  get       /recipes/:id                        => show
#  patch     /recipes/:id                        => update
#  put       /recipes/:id                        => update
#
#++

class RecipesController < ApplicationController

  before_filter :verify_recipe, :only => [:show, :edit, :update, :delete]

  def index
    @categories = Category.all # where('featured_index is not null').order('featured_index asc')
  end

  def show
  end

  def edit

  end

  def new
    @recipe = Recipe.new
    @recipe.ensure_lists
  end

  def create
    @recipe = Recipe.new(params.require(:recipe).permit(:name, :description, :preparation, :image))

    @recipe.locale = 'en'
    @recipe.key = @recipe.name.gsub(' ', '_').downcase

    @valid = true
    update_category(@recipe)
    update_directions(@recipe)
    update_ingredients(@recipe)

    if @valid and @recipe.save
      flash[:notice] = 'Successfully created recipe'
      redirect_to(:action => :show, :id => @recipe.id)
    else
      flash[:error] ||= 'Failed to save recipe'
      redirect_to(:action => :new)
    end
  end

  def update
    @recipe.update_attributes(params.require(:recipe).permit(:name, :description, :preparation, :image))

    @recipe.locale = 'en'
    @recipe.key = @recipe.name.gsub(' ', '_').downcase

    @valid = true
    update_category(@recipe)
    update_directions(@recipe)
    update_ingredients(@recipe)

    if @valid and @recipe.save
      flash[:notice] = 'Successfully updated recipe'
    else
      flash[:error] ||= 'Failed to update recipe'
    end

    redirect_to(:action => :show)
  end


  def delete
    @recipe.destroy
    flash[:notice] = 'Recipe has been deleted'
    redirect_to(action: :index)
  end

private

  def update_category(recipe)
    return unless params[:recipe]

    if params[:recipe][:category_id].blank?
      if params[:new_category_name].blank?
        flash[:error] = 'New category name must be provided'
        @valid = false
      else
        recipe.category = Category.create(
            :name => params[:new_category_name],
            :key => params[:new_category_name].downcase,
            :locale => 'en'
        )
      end
    else
      recipe.category = Category.find_by_id(params[:recipe][:category_id])
    end
  end

  def update_directions(recipe)
    return unless  params[:recipe] and params[:recipe][:directions]

    recipe.directions.delete_all

    params[:recipe][:directions].each do |direction|
      next if direction[:description].blank?
      recipe.directions.build(direction.permit(:description))
    end
  end

  def update_ingredients(recipe)
    return unless params[:recipe] and params[:recipe][:ingredients]
    recipe.ingredients.delete_all

    params[:recipe][:ingredients].each do |ingredient|
      next if ingredient[:quantity].blank?
      recipe.ingredients.build(ingredient.permit(:name, :measurements, :quantity))
    end
  end

  def verify_recipe
    @recipe = params[:id].match(/\d+/) ? Recipe.find_by_id(params[:id]) : Recipe.find_by_key(params[:id])

    unless @recipe
      flash[:error] = 'Invalid recipe id'
      redirect_to(action: :index)
    end
  end

  def category_options
    @category_options ||= begin
      cats = Category.all.order('name asc').collect{|cat| [cat.name, cat.id]}
      cats.unshift(['New category', ''])
    end
  end
  helper_method :category_options

end
