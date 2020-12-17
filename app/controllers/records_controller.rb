class RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def index
    @records = @user.records
  end

  def show
    @record = current_user.record.find(params[:id])
  end

  def new
    @record = current_user.record
  end

  def edit
    @record = current_user.record.find(params[:id])
  end

  def update
    @record = current_user.record.find(params[:id])
    @record.update(update_params)
    redirect_to record_path(@user.id)
  end

  def create
    @record = current_user.record.new(record_memo)
    if @record.save
      redirect_to record_path(@user.id)
    else
      redirect_to new_record_path
    end
  end

  def destroy
    @record = current_user.record.find(params[:id])
    @record.destroy
    redirect_to record_path(@user.id)
  end


  private
  def record_memo
    params.permit(:start_time,:title, :content,:user_id)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def update_params
    params.require(:record).permit(:worked_on,:title, :content,:user_id)
  end
end
