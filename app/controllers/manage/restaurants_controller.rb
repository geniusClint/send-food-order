# frozen_string_literal: true

class Manage::RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[ show edit update destroy ]

  # GET /manage/restaurants or /manage/restaurants.json
  def index
    @restaurants = Restaurant.all
  end

  # GET /manage/restaurants/1 or /manage/restaurants/1.json
  def show
  end

  # GET /manage/restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # GET /manage/restaurants/1/edit
  def edit
  end

  # POST /manage/restaurants or /manage/restaurants.json
  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.build_restaurant_setting

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to manage_restaurant_url(@restaurant), notice: "Restaurant was successfully created." }
        format.json { render :show, status: :created, location: @restaurant }
      else
        logger.error "Error creating restaurant: #{@restaurant.errors.full_messages.join(', ')}"
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manage/restaurants/1 or /manage/restaurants/1.json
  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to manage_restaurant_url(@restaurant), notice: "Restaurant was successfully updated." }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        logger.error "Error updating restaurant: #{@restaurant.errors.full_messages.join(', ')}"
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manage/restaurants/1 or /manage/restaurants/1.json
  def destroy
    @restaurant.destroy!

    respond_to do |format|
      format.html { redirect_to manage_restaurants_url, notice: "Restaurant was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.includes(:state).find_by(slug: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def restaurant_params
      params.require(:restaurant).permit(:name, :location_name, :city, :state_id, :slug)
    end
end
