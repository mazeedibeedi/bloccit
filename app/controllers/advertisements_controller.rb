class AdvertisementsController < ApplicationController
  def index
    @adverts = Advertisement.all
  end

  def show
    @advert = Advertisement.find(params[:id])
  end

  def new
    @advert = Advertisement.new
  end

  def create
    @advert = Advertisement.new
    @advert.title = params[:advertisement][:title]
    @advert.body = params[:advertisement][:body]
    @advert.price = params[:advertisement][:price]

    if @advert.save
      flash[:notice] = "Advert was saved"
      redirect_to @advert
    else
      flash.now[:alert] = "There was an error in saving the advert. Please try again"
      render :new
    end
  end

end
