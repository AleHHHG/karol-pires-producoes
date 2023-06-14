class HiresController < ApplicationController
  before_action :set_hirer, only: %i[ show edit update destroy ]

  # GET /hires or /hires.json
  def index
    @page_title = 'Contratantes'
    @hires = Hire.all
  end

  # GET /hires/1 or /hires/1.json
  def show
  end

  # GET /hires/new
  def new
    @page_title = 'Novo Contratante'
    @hire = Hire.new
  end

  # GET /hires/1/edit
  def edit
    @page_title = 'Editar Contratante'
  end

  # POST /hires or /hires.json
  def create
    @hire = Hire.new(hire_params)

    respond_to do |format|
      if @hire.save
        format.html { redirect_to hires_url, notice: "Contratante criado com sucesso." }
        format.json { render :show, status: :created, location: @hire }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hire.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hires/1 or /hires/1.json
  def update
    respond_to do |format|
      if @hire.update(hire_params)
        format.html { redirect_to hires_url, notice: "Contratante editado com sucesso." }
        format.json { render :show, status: :ok, location: @hire }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hire.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hires/1 or /hires/1.json
  def destroy
    if @hire.events.present?
      flash[:error] =  'Não foi possivel deletar: Contratante vinculado a um evento'
      redirect_to hires_url
    else
      @hire.destroy
      redirect_to hires_url, notice: 'Contratante deletado com sucesso.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hirer
      @hire = Hire.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hire_params
      params.require(:hire).permit(:name, :email, :phone_number)
    end
end
