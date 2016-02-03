#--
# Copyright (c) 2015 Translation Exchange, Inc.
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
#-- ::Api::V1::RecipeController Routing Information
#
#  get       /recipes                            => index
#  get       /recipes/:id                        => show
#  post      /recipes/:id                        => create
#  put       /recipes/:id                        => update
#  delete    /recipes/:id                        => delete
#  get       /recipes/:id/directions             => directions
#  get       /recipes/:id/ingredients            => ingredients
#  get       /api/v1/recipes                     => index
#  get       /api/v1/recipes/:id                 => show
#  post      /api/v1/recipes/:id                 => create
#  put       /api/v1/recipes/:id                 => update
#  delete    /api/v1/recipes/:id                 => delete
#  get       /api/v1/recipes/:id/directions      => directions
#  get       /api/v1/recipes/:id/ingredients     => ingredients
#  get       /recipes                            => index
#
#++

class Api::V1::RecipeController < Api::V1::BaseController

  def index
    @recipes = Recipe.page(page).per(per_page)
  end

  def show
    recipe
  end

  def delete
    recipe.destroy
    render_no_content
  end

  def create
    @recipe = Recipe.create(params.permit(:category_id, :key, :name, :locale, :description, :image, :preparation))
    render(:template => '/api/v1/recipe/show')
  end

  def update
    recipe.update_attributes(params.permit(:key, :name, :locale, :description, :image, :preparation))
    render(:template => '/api/v1/recipe/show')
  end

  def directions
    @directions = recipe.directions.page(page).per(per_page)
    render(:template => '/api/v1/direction/index')
  end

  def ingredients
    @ingredients = recipe.ingredients.page(page).per(per_page)
    render(:template => '/api/v1/ingredient/index')
  end

private

  def recipe
    @recipe ||= Recipe.find(params[:id])
  end

end
