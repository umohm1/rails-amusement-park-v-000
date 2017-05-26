class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def new
    @attraction = Attraction.new
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(attraction_params)
    if @attraction.valid?
      render :show
    end
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :happiness_rating, :nausea_rating, :tickets)
  end
end
