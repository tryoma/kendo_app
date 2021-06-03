class RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def index
    @records = @user.records
    to = Date.today
    from_year = to.beginning_of_year
    from_month = to.beginning_of_month
    @this_year_count = @user.records.where(start_time:from_year..to, practice: true).count
    @this_month_count = @user.records.where(start_time:from_month..to, practice: true).count
  end

  def show
    @record = @user.records.find(params[:id])
  end

  def new
    @record = @user.records.new
  end

  def create
    @record = @user.records.new(record_params)
    if @record.save
      redirect_to user_records_path(@user.id)
      flash[:success] = "稽古日記を投稿しました！"
    else
      render :new
      flash[:denger] = "稽古日記を投稿できませんでした"
    end
  end

  def edit
    @record = @user.records.find(params[:id])
  end

  def update
    @record = @user.records.find(params[:id])
    if @record.update(record_params)
       redirect_to user_records_path(@user.id)
       flash[:success] = "稽古日記を編集しました！"
    else
      render :edit
      flash[:denger] = "稽古日記を投稿できませんでした"
    end
  end

  def destroy
    @record = @user.records.find(params[:id])
    @record.destroy
    redirect_to user_records_path(@user.id)
  end

  private
  def record_params
    params.require(:record).permit(:start_time, :title, :content, :practice)
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
