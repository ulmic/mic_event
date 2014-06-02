class Admin::PlacesController < Admin::ApplicationController
  def index
    @places = Kaminari.paginate_array(PlaceDecorator.decorate_collection(Place.all.reverse)).page(params[:page])
  end

  def new
    @place = Place.new
  end

  def edit
    @place = Place.find params[:id]
  end

  def create
    @place = Place.new params[:place]
    if @place.save
      redirect_to @place
    else
      render action: :new
    end
  end

  def update
    @place = Place.find params[:id]
    if @place.update_attributes params[:place]
      redirect_to @place
    else
      render action: :edit
    end
  end

  def destroy
    @place = Place.find params[:id]
    @place.destroy
    redirect_to places_path
  end
end
