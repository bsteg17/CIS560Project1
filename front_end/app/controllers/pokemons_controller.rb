class PokemonsController < ApplicationController
  before_action :set_pokemon, only: [:show, :edit, :update, :destroy]

  # GET /pokemons
  # GET /pokemons.json
  def index
    @pokemons = Pokemon.all
  end

  # GET /pokemons/1
  # GET /pokemons/1.json
  def show
    @pokemon = Pokemon.find(params[:id])
  end

  # GET /pokemons/new
  def new
    @pokemon = Pokemon.new
  end

  # GET /pokemons/1/edit
  def edit
  end

  # POST /pokemons
  # POST /pokemons.json
  def create
    @pokemon = Pokemon.new(pokemon_params)

    respond_to do |format|
        ActiveRecord::Base.connection.execute("insert into pokemons (pokemon_name, image, cp, hp) values ('"+params[:pokemon][:pokemon_name]+"', '"+params[:pokemon][:image]+"', '"+params[:pokemon][:cp]+"','"+params[:pokemon][:hp]+"');")
        format.html { redirect_to @pokemon, notice: 'Pokemon was successfully created.' }
        format.json { render :show, status: :created, location: @pokemon }
    end
  end

  # PATCH/PUT /pokemons/1
  # PATCH/PUT /pokemons/1.json
  def update
    respond_to do |format|
      ActiveRecord::Base.connection.execute("update pokemons set image='"+params[:pokemon][:image]+"', cp='"+params[:pokemon][:cp]+"', hp='"+params[:pokemon][:hp]+"' where pokemon_name = '"+params[:id]+"';")
      format.html { redirect_to @pokemon, notice: 'Pokemon was successfully updated.' }
      format.json { render :show, status: :ok, location: @pokemon }
    end
  end

  # DELETE /pokemons/1
  # DELETE /pokemons/1.json
  def destroy
    @pokemon.destroy
    respond_to do |format|
      format.html { redirect_to pokemons_url, notice: 'Pokemon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pokemon
      @pokemon = Pokemon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pokemon_params
      params.fetch(:pokemon, {}).permit!
    end
end
