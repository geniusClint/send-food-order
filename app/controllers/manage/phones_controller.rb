# frozen_string_literal: true

class Manage::PhonesController < ApplicationController
  before_action :set_phone, only: %i[ show edit update destroy ]
  before_action :set_user, only: %i[ create ]
  before_action :set_restaurant, only: %i[ create ]

  # GET /manage/phones or /manage/phones.json
  def index
    @phones = Phone.all
  end

  # GET /manage/phones/1 or /manage/phones/1.json
  def show
  end

  # GET /manage/phones/new
  def new
    @phone = Phone.new
  end

  # GET /manage/phones/1/edit
  def edit
  end

  # POST /manage/phones or /manage/phones.json
  def create
    @phone = phone_build

    respond_to do |format|
      if @phone.save
        format.html { redirect_to manage_phone_url(@phone), notice: "Phone was successfully created." }
        format.json { render :show, status: :created, location: @phone }
      else
        logger.error "Error creating phone: #{@phone.errors.full_messages.join(', ')}"
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @phone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manage/phones/1 or /manage/phones/1.json
  def update
    respond_to do |format|
      if @phone.update(phone_params)
        format.html { redirect_to manage_phone_url(@phone), notice: "Phone was successfully updated." }
        format.json { render :show, status: :ok, location: @phone }
      else
        logger.error "Error updating phone: #{@phone.errors.full_messages.join(', ')}"
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @phone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manage/phones/1 or /manage/phones/1.json
  def destroy
    @phone.destroy!

    respond_to do |format|
      format.html { redirect_to manage_phones_url, notice: "Phone was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_phone
      @phone = Phone.find(params[:id])
    end

    def set_user
      @user = User.find(params[:phone][:phonable_id]) if params[:phone][:phonable_type] == "User"
    end

    def set_restaurant
      @restaurant = Restaurant.find(params[:phone][:phonable_id]) if params[:phone][:phonable_type] == "Restaurant"
    end

    def phone_build
      logger.debug "Building phone with params #{phone_params}. Phonable type is #{phone_params[:phonable_type]}"
      case phone_params[:phonable_type]
      when "User"
        @user.phones.build(phone_params)
      when "Restaurant"
        @restaurant.phones.build(phone_params)
      end
    end

    # Only allow a list of trusted parameters through.
    def phone_params
      params.require(:phone).permit(:phone_type, :country_code, :number, :phone_contirmation_token, :phone_confirmation_token_expiration, :phone_confirmed, :phonable_id, :phonable_type)
    end
end
