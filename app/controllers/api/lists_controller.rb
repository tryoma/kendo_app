class Api::ListsController < ApplicationController
  def index
    @lists = List.order('created_at DESC')
  end

  def create
    @list = List.new(list_params)
    if @list.save
      render :index, status: :created
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @list = List.find(params[:id]).destroy!
  end

  def update
    @list = List.find(params[:id]).toggle!(:is_done)
  end

  private

  def list_params
    params.permit(:title)
  end
end
