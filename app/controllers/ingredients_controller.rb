class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update]

  def index
    @ingredients = Ingredient.all
  end

  def show
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.create(ingredient_params)
    if @ingredient.valid?
      redirect_to @ingredient
    else
      flash.now[:errors] = @ingredient.errors.full_messages
      render 'new'
    end
  end

  def edit
  end

  def update
    @ingredient.update(ingredient_params)
    if @ingredient.valid?
      redirect_to @ingredient
    else
      flash.now[:errors] = @ingredient.errors.full_messages
      render 'edit'
    end
  end


  private

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end


end
