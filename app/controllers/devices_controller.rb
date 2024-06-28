class DevicesController < ApplicationController
  before_action :authenticate_user!

  def create
    @device = current_user.device.build(device_params)
    if @device.save
      render json: { message: 'Device registered successfully' }, status: :created
    else
      render json: { errors: @device.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @device =
      current_user.devices.find(params[:id])
    @device.destroy
    render json: { message: 'Device removed successfully' }, status: :ok
  end

  private

  def device_params
    params.require(:device).permit(:device_name, :device_token)
  end
end
