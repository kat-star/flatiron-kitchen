class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update]

  def show
  end

  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
  end

  def create
    @recipe = Recipe.create(recipe_params)
    if @recipe.valid?
      redirect_to @recipe
    else
      flash.now[:errors] = @recipe.errors.full_messages
      @ingredients = Ingredient.all
      render 'new'
    end
  end

  def edit
    @ingredients = Ingredient.all
  end

  def update
    @recipe.update(recipe_params)
    if @recipe.valid?
      redirect_to @recipe
    else
      flash.now[:errors] = @recipe.errors.full_messages
      @ingredients = Ingredient.all
      render 'edit'
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids: [])
  end


end
