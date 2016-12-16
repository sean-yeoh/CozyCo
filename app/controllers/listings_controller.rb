class ListingsController < ApplicationController
  def index
    @listings = Listing.all
    @listing_types = ListingType.pluck(:name)
  end

  def search
    @listings = Listing.where(nil)
    search = search_params(params)

    if !search[:listing_type_id].blank?
      search[:listing_type_id] = ListingType.find_by_name(search[:listing_type_id]).id
    end

    search.each do |key, value|
      @listings = @listings.public_send(key, value) if value.present?
    end

    @listing_types = ListingType.pluck(:name)

    if @listings.empty?
      flash[:alert] = "No record found. Please search again."
    end

    render 'listings/index'
  end

  def new
    @listing = Listing.new
    @listing_types = ListingType.pluck(:name)
  end

  def create
    price = listing_params[:price].split(".")
    if price[1].nil?
      @price = listing_params[:price] << ".00"
      @listing = current_user.listings.new(text: listing_params[:text], price: @price, listing_type_id: ListingType.find_by_name(listing_params[:listing_type_id]).id)
      if @listing.save
        redirect_to @listing
      else
        flash[:alert] = "Your listing can't be saved."
        @listing = Listing.new
        @listing_types = ListingType.pluck(:name)
        render 'new'
      end
    elsif price[1].length == 1
      flash.now[:alert] = "There is only 1 decimal. Please input price again."
      @listing = Listing.new
      @listing_types = ListingType.pluck(:name)
      render "new"
    elsif price[1].length == 0
      @price = listing_params[:price] << "00"
      @listing = current_user.listings.new(text: listing_params[:text], price: @price, listing_type_id: ListingType.find_by_name(listing_params[:listing_type_id]).id)
      if @listing.save
        redirect_to @listing
      else
        flash[:alert] = "Your listing can't be saved."
        @listing_types = ListingType.pluck(:name)
        render 'new'
      end
    elsif price[1].length > 2
      flash.now[:alert] = "There are more than 2 decimals. Please input price again."
      @listing = Listing.new
      @listing_types = ListingType.pluck(:name)
      render "new"
    else
      @price = listing_params[:price]
      @listing = current_user.listings.new(text: listing_params[:text], price: @price, listing_type_id: ListingType.find_by_name(listing_params[:listing_type_id]).id)
      if @listing.save
        redirect_to @listing
        else
        flash[:alert] = "Your listing can't be saved."
        render 'new'
      end
    end
  end

  def show
    @listing = Listing.find(params[:id])
  end

  private
  def listing_params
    params.require(:listing).permit(:text, :listing_type_id, :price)
  end

  def search_params(params)
    params.slice(:listing_type_id, :min_price, :max_price)
  end
end
