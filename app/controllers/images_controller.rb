class ImagesController < ApplicationController
  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)

    if @image.save
      redirect_to image_path(@image)
    else
      render :new
    end
  end

  private

  def image_params
    params.require(:image).permit(:image_url)
  end
end
