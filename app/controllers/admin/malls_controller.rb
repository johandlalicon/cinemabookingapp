class Admin::MallsController < ApplicationController

    before_action :require_admin, only: [:new, :create]  # Use your authentication method here

  def index
    @malls = Mall.all
  end
  def new
    @mall = Mall.new
  end

  def create
    @mall = Mall.new(mall_params)
    if @mall.save
        create_cinemas_for_mall
        redirect_to admin_mall_path(@mall), notice: 'Mall was successfully created.'
    else
        render :new
    end
  end

  def show
    @mall = Mall.find(params[:id])
  end

  def destroy
    @mall = Mall.find(params[:id])
    if @mall.destroy
      redirect_to admin_malls_path, notice: 'Mall was successfully deleted.'
    else
      flash[:alert] = 'Unable to delete the mall.'
      redirect_to admin_mall_path(@mall)
    end
  end

  private

  def mall_params
    params.require(:mall).permit(:name, :location, :number_of_cinemas)
  end

  def require_admin
    unless current_user && current_user.isAdmin?
      flash[:alert] = "You must be an admin to access this page."
      redirect_to root_path
    end
  end

  def create_cinemas_for_mall
    @mall.number_of_cinemas.times do |i|
      @mall.cinemas.create(cinema_number: i + 1)
    end
  end

end
