class PublishersController < ApplicationController

  before_action :authenticate_user!

  before_action :set_publisher, only: [:edit, :update, :show, :destroy]

  def index
    @q = current_user.publishers.includes(:attachments).ransack(params[:q])
    @publishers = @q.result.order("id desc").page(params[:page]).per(10)
  end

  def new
    @publisher = Publisher.new
    @publisher.attachments.build
    @publisher.attachments.build
  end

  def create
    @publisher = current_user.publishers.new(publisher_params)
    if @publisher.save
      redirect_to publishers_path
    else
      render :new
    end  
  end

  def edit

  end

  def update
    if @publisher.update(publisher_params)
      redirect_to publisher_path(@publisher)
    else
      render :edit
    end
  end

  def show

  end

  def destroy
    if @publisher.destroy
      redirect_to publishers_path
    else
      redirect_to publisher_path(@publisher), alert: 'Failed to delete publisher'
    end
  end

  private
    def set_publisher
      @publisher = current_user.publishers.find(params[:id])
    end

    def publisher_params
      params.require(:publisher).permit(
        :name,
        :card_no,
        :birthday,
        attachments_attributes: [:id, :image]
      )
    end

end
