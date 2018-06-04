require "redcarpet"

class BuildingsController < ApplicationController
  before_action :set_building, only: [:show, :edit, :update, :destroy, :show_versions]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /buildings
  # GET /buildings.json
  def index
    @buildings = Building.all
  end

  # GET /buildings/1
  # GET /buildings/1.json
  def show
    if params[:version]
      @version_id = params[:version]
      @building = PaperTrail::Version.find(@version_id).reify
    end

    renderer = Redcarpet::Render::HTML.new(filter_html: true)
    markdown = Redcarpet::Markdown.new(renderer)
    @description = markdown.render(@building.description)
  end

  def show_versions
  end

  def show_versions
  end

  # GET /buildings/new
  def new
    @architect = Architect.find params[:architect_id]
    @building = Building.new architect: @architect
  end

  # GET /buildings/1/edit
  def edit
  end

  # POST /buildings
  # POST /buildings.json
  def create
    @building = Building.new(building_params)

    respond_to do |format|
      if @building.save
        format.html { redirect_to @building, notice: 'Building was successfully created.' }
        format.json { render :show, status: :created, location: @building }
      else
        format.html { render :new }
        format.json { render json: @building.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buildings/1
  # PATCH/PUT /buildings/1.json
  def update
    delete_images
    respond_to do |format|
      if @building.update(building_params)
        format.html { redirect_to @building, notice: 'Building was successfully updated.' }
        format.json { render :show, status: :ok, location: @building }
      else
        format.html { render :edit }
        format.json { render json: @building.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buildings/1
  # DELETE /buildings/1.json
  def destroy
    @building.destroy
    respond_to do |format|
      format.html { redirect_to buildings_url, notice: 'Building was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def delete_images
    image_param_keys = params["building"].keys.select { |key| key.include? "remove_image_" }
    image_param_keys.each do |key|
      image_id = image_id_from_param_key key
      if params["building"][key] == "1"
        image = Image.find image_id
        image.remove_filename!
        image.destroy
      end
    end
  end

  private

  def image_id_from_param_key(key)
    matches = /remove_image_(\d+)/.match(key)
    matches[1]
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_building
      @building = Building.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def building_params
      params.require(:building).permit(:architect_id, :apn, :year, :address1, :building_type, :building_id, :city, :zip, :family, :type, :status, :source, :notes, :gsv, :key, :description)
    end
end
