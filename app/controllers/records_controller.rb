class RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def index
    @records = @user.records
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
      flash[:success] = "OK"
    else
      render new_user_record_path(@user.id)
      flash[:success] = "NG"
    end
  end

  def edit
    @record = @user.records.find(params[:id])
  end

  def update
    @record = @user.records.find(params[:id])
    if @record.update(record_params)
       redirect_to user_records_path(@user.id)
       flash[:success] = "OK"
    else
      render edit_user_record_path(@user.id)
      flash[:success] = "NG"
    end
  end

  def destroy
    @record = @user.records.find(params[:id])
    @record.destroy
    redirect_to user_records_path(@user.id)
  end


  private
  def record_params
    params.require(:record).permit(:start_time, :title, :content)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

end
