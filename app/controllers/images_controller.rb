class ImagesController < ApplicationController
  def index
    @images = if params[:tag]
                Image.tagged_with(params[:tag]).order(created_at: :desc)
              else
                Image.order(created_at: :desc).all
              end
  end

  def show
    @image = Image.find(params[:id])
  end

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
    params.require(:image).permit(:image_url, :tag_list)
  end
end
