class SuppliersController < ApplicationController
  before_action :set_supplier, only: %i[ show edit update destroy ]

  # GET /suppliers or /suppliers.json
  def index
    @page_title = 'Fornecedores'
    @suppliers = Supplier.all
  end

  # GET /suppliers/1 or /suppliers/1.json
  def show
  end

  # GET /suppliers/new
  def new
    @page_title = 'Novo Fornecedor'
    @supplier = Supplier.new
  end

  # GET /suppliers/1/edit
  def edit
    @page_title = 'Editar Fornecedor'
  end

  # POST /suppliers or /suppliers.json
  def create
    @supplier = Supplier.new(supplier_params)

    respond_to do |format|
      if @supplier.save
        format.html { redirect_to suppliers_url, notice: "Fornecedor criado com sucesso." }
        format.json { render :show, status: :created, location: @supplier }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /suppliers/1 or /suppliers/1.json
  def update
    respond_to do |format|
      if @supplier.update(supplier_params)
        format.html { redirect_to suppliers_url, notice: "Fornecedor editado com sucesso." }
        format.json { render :show, status: :ok, location: @supplier }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suppliers/1 or /suppliers/1.json
  def destroy
    if @supplier.orders.present?
      flash[:error] =  'Não foi possivel deletar: Forncedor vinculado a um ou mais pedidos'
      redirect_to suppliers_url
    else
      @supplier.destroy
      redirect_to suppliers_url, notice: 'Fornecedor deletado com sucesso.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supplier
      @supplier = Supplier.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def supplier_params
      params.require(:supplier).permit(:name, :document_number, :phone, :email, :adress, :bank, :ag, :cc, :pix)
    end
end
