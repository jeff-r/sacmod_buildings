class ImageController < ApplicationController
  def create
    # @image = Image.new(image_params)
    @image = Image.new(filename: params[:file])
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
