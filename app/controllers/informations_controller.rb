class InformationsController < ApplicationController

  def index
    @informations = Information.paginate(page: params[:page])
  end

  def show
    @information = Information.find(params[:id])
  end

  def new
    @information = Information.new
  end

  def create
    @information = Information.new(information_params)
    if @information.save
      flash[:success] = '新規作成に成功しました。'
      redirect_to @information
    else
      render :new
    end
  end

  def edit
    @information = Information.find(params[:id])
  end

  def update
    @information = Information.find(params[:id])
    if @information.update_attributes(information_params)
      flash[:success] = "稽古会情報を更新しました。"
      redirect_to @information
    else
      render :edit      
    end
  end

  def destroy
    @information = Information.find(params[:id])
    @information.destroy
    flash[:success] = "#{@information.title}のデータを削除しました。"
    redirect_to informations_url
  end

  private

    def information_params
      params.require(:information).permit(:title, :body, :until, :attachment, :user_id)
    end
end
