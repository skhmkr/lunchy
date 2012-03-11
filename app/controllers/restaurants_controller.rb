class RestaurantsController < ApplicationController
  
  CONSUMER_KEY = "F-x2DIZU7u5-gCq3wZTruQ"
  CONSUMER_SECRET = "q9PWchOA-QLFU5FpYKHYyGwPtOc"
  TOKEN = "Y03VisXzg-08v8GtcBh0ho8bbFpIQbnu"
  TOKEN_SECRET = "D4dAZi8Zvxb0o0YXm2Dr_4SHN3k"
  
  def round_float(value)
    Integer(value.to_f * 100) / Float(100)
  end
  
  def find_businesses(city, state, food)
    businesses = []
    client = Yelp::V2
    
    city_state = city + "," + state    
    yelp_cli = Yelp::V2.new(CONSUMER_KEY, CONSUMER_SECRET, TOKEN, TOKEN_SECRET)
    responses = yelp_cli.search(food, city_state)
                   
    responses["businesses"].each do |business|
      businesses << Restaurant.new(:name => business["name"], :address => business["address1"], 
      :city => business["location"]["city"], :state => business["location"]["state_code"], :avg_rating => business["rating"],
      :review_count => business["review_count"], :link => business["url"],
      :lat => round_float(business["location"]["coordinate"]["latitude"]) , :lon => round_float(business["location"]["coordinate"]["longitude"]),
       )
    end
    businesses
  end
  
  def index
    @default_cusines = ["american","chinese","french","greek","indian",
    "italian","japanese","mexican","middle eastern","mexican","spanish",
    "thai"]

    @location = Location.find(params[:location_id])
    session[:location_id] = @location.id
    @businesses = []
    #@businesses += find_businesses(@location.city,@location.state,["mexican"])
  #  @businesses += find_businesses(@location.city,@location.state,["chinese"])
    #@businesses += find_businesses(@location.city,@location.state,["italian"])
  #  @businesses += find_businesses(@location.city,@location.state,["indian"])
    @businesses += find_businesses(@location.city,@location.state,["thai"])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @businesses}
    end
  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
    @restaurant = Restaurant.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @restaurant }
    end
  end

  # GET /restaurants/new
  # GET /restaurants/new.json
  def new
    @restaurant = Restaurant.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @restaurant }
    end
  end

  def search
    @default_cusines = ["american","chinese","french","greek","indian",
    "italian","japanese","mexican","middle eastern","mexican","spanish",
    "thai"]
    
    search = []
    @location = Location.find(session[:location_id])
    search << params[:search]
    @search = params[:search]
    @businesses = find_businesses(@location.city,@location.state,search)
    render "index"
   end
  
  # GET /restaurants/1/edit
  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  # POST /restaurants
  # POST /restaurants.json
  def create
    @restaurant = Restaurant.new(params[:restaurant])

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully created.' }
        format.json { render json: @restaurant, status: :created, location: @restaurant }
      else
        format.html { render action: "new" }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /restaurants/1
  # PUT /restaurants/1.json
  def update
    @restaurant = Restaurant.find(params[:id])

    respond_to do |format|
      if @restaurant.update_attributes(params[:restaurant])
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy

    respond_to do |format|
      format.html { redirect_to restaurants_url }
      format.json { head :no_content }
    end
  end
end
