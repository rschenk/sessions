class KitesController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /kites
  # GET /kites.json
  def index
    @kites = current_user.kites.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @kites }
    end
  end

  # GET /kites/1
  # GET /kites/1.json
  def show
    @kite = current_user.kites.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @kite }
    end
  end

  # GET /kites/new
  # GET /kites/new.json
  def new
    @kite = current_user.kites.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @kite }
    end
  end

  # GET /kites/1/edit
  def edit
    @kite = current_user.kites.find(params[:id])
  end

  # POST /kites
  # POST /kites.json
  def create
    @kite = current_user.kites.new(params[:kite])

    respond_to do |format|
      if @kite.save
        format.html { redirect_to @kite, notice: 'Kite was successfully created.' }
        format.json { render json: @kite, status: :created, location: @kite }
      else
        format.html { render action: "new" }
        format.json { render json: @kite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /kites/1
  # PUT /kites/1.json
  def update
    @kite = current_user.kites.find(params[:id])

    respond_to do |format|
      if @kite.update_attributes(params[:kite])
        format.html { redirect_to @kite, notice: 'Kite was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @kite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kites/1
  # DELETE /kites/1.json
  def destroy
    @kite = current_user.kites.find(params[:id])
    @kite.destroy

    respond_to do |format|
      format.html { redirect_to kites_url }
      format.json { head :no_content }
    end
  end
end
