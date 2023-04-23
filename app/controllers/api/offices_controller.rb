class Api::OfficesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :requires_login, only: [:index, :edit, :update, :destroy]
  # before_action :get_user, only: [:edit, :update, :destroy]
  before_action :get_office, only: [:show, :edit, :destroy]

  def index
    @offices = Office.all

    render json: @offices
  end

  def new
    @office = Office.new

    render json: @office
  end

  def create
    @office = Office.new(office_params)

    if @office.save
      render json: @office
    else
      render json: @office.errors.full_messages
    end
  end

  def show
    render json: @office
  end

  def edit
    render json: @office
  end

  def destroy
    render json: @office
  end

  private

  def office_params
    params.require(:office).permit(:name, :address)
  end

  def get_office
    @office = Office.find(params[:id])
  end
end
