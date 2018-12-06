class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build
    @recipe.ingredients.build
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      render :new
    end
  end

  private

    def recipe_params
      params.require(:recipe).permit(:title, :ingredients_attributes => [:ingredient_1, :quantity_1, :ingredient_2, :quantity_2])
    end

end


# {"utf8"=>"✓",
#  "authenticity_token"=>
#   "uN5AEtUmFp/czLXpF3HzTUvgotF9v2ltPzyEYPTLWcID/IQ9WFQpmqdHsxjQQhA6MvR252AoXnKuld/O+Y12mQ==",
#  "recipe"=>
#   {"title"=>"weird recipe",
#    "ingredients"=>{"ingredient_1"=>"weed", "ingredient_2"=>"hash"}},
#  "commit"=>"Create Recipe",
#  "controller"=>"recipes",
#  "action"=>"create"}
