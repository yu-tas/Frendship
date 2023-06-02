class PicturesController < ApplicationController
  def index
    @pictures =  Picture.all
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def edit
  end

  def new
    @picture= Picture.new
  end

  def create
    Picture.create(picture_params)
    redirect_to new_picture_path
  end

  def update
  end

  def destroy
  end

  private

    def picture_params
      params.require(:picture).permit(:content, :picture)
    end
end
