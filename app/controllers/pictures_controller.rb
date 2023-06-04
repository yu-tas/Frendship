class PicturesController < ApplicationController
  def index
    @pictures =  Picture.all
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def new
    @picture= Picture.new
  end

  def create
    @picture = current_user.pictures.build(picture_params)
    if params[:back]
      render :new
    else
      if @picture.save
        redirect_to pictures_path, notice: "tweetを作成しました！"
      else
        render :new  
      end
    end           
  end

  def update
    @picture = Picture.find(params[:id])
      if @picture.update(picture_params)
        redirect_to picture_path, notice: "投稿を編集しました！"
      else 
        render :edit
      end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to pictures_path, notice:"投稿を削除しました！"    
  end

  def confirm
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
    render :new if @picture.invalid?
  end
  

  private

    def picture_params
      params.require(:picture).permit(:content, :image)
    end
end
