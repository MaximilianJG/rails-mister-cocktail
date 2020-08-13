class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(strong_cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail), notice: 'Cocktail was successfully created.'
    else
      render :new
    end

  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  private

  def strong_cocktail_params
      params.require(:cocktail).permit(:name)
  end

end
