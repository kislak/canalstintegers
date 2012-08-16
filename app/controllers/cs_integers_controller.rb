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

  # GET /cs_integers/new
  # GET /cs_integers/new.json
  def new
    @cs_integer = CsInteger.random

    respond_to do |format|
      format.html { redirect_to @cs_integer, notice: 'You have been issued an integer!' }
      format.json { render json: @cs_integer, status: :created, location: @cs_integer }
    end
  end

  # GET /cs_integers/1/edit
  # def edit
  #   @cs_integer = CsInteger.find(params[:id])
  # end

  # POST /cs_integers
  # POST /cs_integers.json
  # def create
  #   @cs_integer = CsInteger.new(params[:cs_integer])

  #   respond_to do |format|
  #     if @cs_integer.save
  #       format.html { redirect_to @cs_integer, notice: 'Cs integer was successfully created.' }
  #       format.json { render json: @cs_integer, status: :created, location: @cs_integer }
  #     else
  #       format.html { render action: "new" }
  #       format.json { render json: @cs_integer.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PUT /cs_integers/1
  # PUT /cs_integers/1.json
  # def update
  #   @cs_integer = CsInteger.find(params[:id])

  #   respond_to do |format|
  #     if @cs_integer.update_attributes(params[:cs_integer])
  #       format.html { redirect_to @cs_integer, notice: 'Cs integer was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: "edit" }
  #       format.json { render json: @cs_integer.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /cs_integers/1
  # DELETE /cs_integers/1.json
  # def destroy
  #   @cs_integer = CsInteger.find(params[:id])
  #   @cs_integer.destroy

  #   respond_to do |format|
  #     format.html { redirect_to cs_integers_url }
  #     format.json { head :no_content }
  #   end
  # end
end
