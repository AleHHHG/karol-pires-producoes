class OwnersController < ApplicationController
  before_action :set_owner, only: %i[ show edit update destroy ]

  # GET /owners or /owners.json
  def index
    @page_title = 'Solicitantes'
    @owners = Owner.all
  end

  # GET /owners/1 or /owners/1.json
  def show
  end

  # GET /owners/new
  def new
    @page_title = 'Novo Solicitante'
    @owner = Owner.new
  end

  # GET /owners/1/edit
  def edit
    @page_title = 'Editar Solicitante'
  end

  # POST /owners or /owners.json
  def create
    @owner = Owner.new(owner_params)

    respond_to do |format|
      if @owner.save
        format.html { redirect_to owners_url, notice: "Solicitante criado com sucesso." }
        format.json { render :show, status: :created, location: @owner }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /owners/1 or /owners/1.json
  def update
    respond_to do |format|
      if @owner.update(owner_params)
        format.html { redirect_to owners_url, notice: "Solicitante editado com sucesso." }
        format.json { render :show, status: :ok, location: @owner }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /owners/1 or /owners/1.json
  def destroy
    if @owner.orders.present?
      flash[:error] =  'Não foi possivel deletar: Solicitante vinculado a um ou mais pedidos'
      redirect_to owners_url
    else
      @owner.destroy
      redirect_to owners_url, notice: 'Solicitante deletado com sucesso.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_owner
      @owner = Owner.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def owner_params
      params.require(:owner).permit(:name)
    end
end
