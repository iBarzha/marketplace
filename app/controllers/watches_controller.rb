class WatchesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_watch, only: [:show, :edit, :update, :destroy]

  def index
    @watches = Watch.all
  end

  def show
  end

  def new
    @watch = current_user.watches.build
  end

  def create
    @watch = current_user.watches.build(watch_params)
    if @watch.save
      redirect_to @watch, notice: 'Watch was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @watch.update(watch_params)
      redirect_to @watch, notice: 'Watch was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @watch.destroy
    redirect_to watches_url, notice: 'Watch was successfully destroyed.'
  end

  private

  def set_watch
    @watch = Watch.find(params[:id])
  end

  def watch_params
    params.require(:watch).permit(:name, :brand, :price, :description, :condition, :image_url)
  end
end
