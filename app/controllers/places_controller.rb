class PlacesController < ApplicationController
  def index
    @places = Kaminari.paginate_array(PlaceDecorator.decorate_collection(Place.all.reverse)).page(params[:page])
  end

  def show
    @place = Place.find params[:id]
  end
end
