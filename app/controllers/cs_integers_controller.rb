class CsIntegersController < ApplicationController
  # GET /cs_integers
  # GET /cs_integers.json
  def index
    @cs_integers = CsInteger.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cs_integers }
    end
  end

  # GET /cs_integers/1
  # GET /cs_integers/1.json
  def show
    @cs_integer = CsInteger.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cs_integer }
    end
  end

  # GET /cs_integers/1/edit
  # def edit
  #   @cs_integer = CsInteger.find(params[:id])
  # end

  # POST /cs_integers
  # POST /cs_integers.json
  def create
    @cs_integer = CsInteger.random

    respond_to do |format|
      format.html { redirect_to @cs_integer, notice: 'You have been issued an integer!' }
      format.json { render json: @cs_integer, status: :created, location: @cs_integer }
    end
  end


end
