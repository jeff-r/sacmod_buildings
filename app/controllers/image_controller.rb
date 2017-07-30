class ImageController < ApplicationController
  def new
    @building_id = params[:building_id]
  end

  def create
    @image = Image.new(filename: params[:file], building_id: params[:building_id])
    if @image.save!
      respond_to do |format|
        format.json { render json: @image }
      end
    end
  end

  private

  def image_params
    params.require(:file)
  end
end
