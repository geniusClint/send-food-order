# frozen_string_literal: true

class Manage::RestaurantSettingsController < ApplicationController
  before_action :set_restaurant_setting, only: %i[ show edit update destroy ]

  # GET /restaurant_settings or /restaurant_settings.json
  def index
    @restaurant_settings = RestaurantSetting.all
  end

  # GET /restaurant_settings/1 or /restaurant_settings/1.json
  def show
  end

  # GET /restaurant_settings/new
  def new
    @restaurant_setting = RestaurantSetting.new
  end

  # GET /restaurant_settings/1/edit
  def edit
  end

  # POST /restaurant_settings or /restaurant_settings.json
  def create
    @restaurant_setting = RestaurantSetting.new(restaurant_setting_params)

    respond_to do |format|
      if @restaurant_setting.save
        format.html { redirect_to manage_restaurant_setting_url(@restaurant_setting), notice: "Restaurant setting was successfully created." }
        format.json { render :show, status: :created, location: @restaurant_setting }
      else
        logger.error "Error creating restaurant setting: #{@restaurant_setting.errors.full_messages.join(', ')}"
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @restaurant_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurant_settings/1 or /restaurant_settings/1.json
  def update
    respond_to do |format|
      if @restaurant_setting.update(restaurant_setting_params)
        format.html { redirect_to manage_restaurant_setting_url(@restaurant_setting), notice: "Restaurant setting was successfully updated." }
        format.json { render :show, status: :ok, location: @restaurant_setting }
      else
        logger.error "Error updating restaurant setting: #{@restaurant_setting.errors.full_messages.join(', ')}"
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @restaurant_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurant_settings/1 or /restaurant_settings/1.json
  def destroy
    @restaurant_setting.destroy!

    respond_to do |format|
      format.html { redirect_to manage_restaurant_settings_url, notice: "Restaurant setting was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant_setting
      @restaurant_setting = RestaurantSetting.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def restaurant_setting_params
      params.require(:restaurant_setting).permit(:tax_rate, :website, :reporting_code, :order_cutoff_minutes, :notify_email, :notification_email, :timezone, :day_start_time, :restaurant_id)
    end
end
