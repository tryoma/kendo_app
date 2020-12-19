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
    else
      redirect_to new_user_record_path(@user.id)
    end
  end

  def edit
    @record = current_user.record.find(params[:id])
  end

  def update
    @record = current_user.record.find(params[:id])
    @record.update(update_params)
    redirect_to record_path(@user.id)
  end


  def destroy
    @record = current_user.record.find(params[:id])
    @record.destroy
    redirect_to record_path(@user.id)
  end


  private
  def record_params
    params.require(:record).permit(:start_time, :title, :content)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def update_params
    params.require(:record).permit(:worked_on,:title, :content,:user_id)
  end
end
