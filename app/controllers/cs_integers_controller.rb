class CsIntegersController < ApplicationController
  protect_from_forgery :except => :create
  rescue_from ActiveRecord::RecordNotFound, :with => :not_found

  # GET /cs_integers
  # GET /cs_integers.json
  # def index
  #   #@cs_integers = CsInteger.all
  #   #TODO: BLOW ME UP?!
  #   respond_to do |format|
  #     format.html # index.html.erb
  #     format.json { render json: @cs_integers }
  #   end
  # end

  # GET /cs_integers/1
  # GET /cs_integers/1.json
  def show
    @cs_integer = CsInteger.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render_for_api :basic_info, :json => @cs_integer }
      format.xml  { render_for_api :basic_info, :xml  => @cs_integer }
    end
  end

  # GET /cs_integers/new
  def new
  end

  # POST /cs_integers
  # POST /cs_integers.json
  def create
    @cs_integer = CsInteger.random

    respond_to do |format|
      format.html { redirect_to @cs_integer, notice: 'You have been issued an integer!' }
      format.json { render_for_api :basic_info, :json => @cs_integer, status: :created, location: @cs_integer }
      format.xml  { render_for_api :basic_info, :xml  => @cs_integer, status: :created, location: @cs_integer }
    end
  end

  def not_found
    respond_to do |format|
      format.html { render :file => File.join(Rails.root, 'public', '404'), :status => :not_found }
      format.json { render :text => '{"error": "not_found"}', :status => :not_found }
      format.xml  { render :text => '<error>not_found</error>', :status => :not_found  }
    end
  end


end
