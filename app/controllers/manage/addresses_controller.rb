# frozen_string_literal: true

class Manage::AddressesController < ApplicationController
  before_action :set_address, only: %i[ show edit update destroy ]
  before_action :set_user, only: %i[ new create ]
  before_action :set_restaurant, only: %i[ new create ]

  # GET /addresses or /addresses.json
  def index
    @addresses = Address.all
  end

  # GET /addresses/1 or /addresses/1.json
  def show
  end

  # GET /addresses/new
  def new
    @address = Address.build
  end

  # GET /addresses/1/edit
  def edit
  end

  # POST /addresses or /addresses.json
  def create
    @address = address_build

    respond_to do |format|
      if @address.save
        format.html { redirect_to manage_address_url(@address), notice: "Address was successfully created." }
        format.json { render :show, status: :created, location: @address }
      else
        logger.error "Error creating address: #{@address.errors.full_messages.join(', ')}"
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /addresses/1 or /addresses/1.json
  def update
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to manage_address_url(@address), notice: "Address was successfully updated." }
        format.json { render :show, status: :ok, location: @address }
      else
        logger.error "Error updating address: #{@address.errors.full_messages.join(', ')}"
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /addresses/1 or /addresses/1.json
  def destroy
    @address.destroy!

    respond_to do |format|
      format.html { redirect_to manage_addresses_url, notice: "Address was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find(params[:address][:addressable_id]) if params.dig(:address, :addressable_type) == "User"
      @user = User.find(params[:addressable_id]) if params[:addressable_type] == "User"
    end

    def set_restaurant
      @restaurant = Restaurant.find(params[:address][:addressable_id]) if params.dig(:address, :addressable_type) == "Restaurant"
      @restaurant = Restaurant.find(params[:addressable_id]) if params[:addressable_type] == "Restaurant"
    end

    def address_build
      case address_params[:addressable_type]
      when "User"
        @address = @user.addresses.build(address_params)
      when "Restaurant"
        @address = @restaurant.addresses.build(address_params)
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Address.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def address_params
      params.require(:address).permit(:address_type, :address1, :address2, :suite, :city, :state_id, :zipcode, :addressable_id, :addressable_type, :latitude, :longitude)
    end
end
