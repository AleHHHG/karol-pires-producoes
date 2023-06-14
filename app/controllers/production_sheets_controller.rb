class ProductionSheetsController < ApplicationController
  before_action :set_product_sheet, only: %i[ edit update ]

  # GET /product_sheets/1/edit
  def edit
    @page_title = 'Ficha de produção'
  end

  # PATCH/PUT /product_sheets/1 or /product_sheets/1.json
  def update
    respond_to do |format|
      if @product_sheet.update(product_sheet_params)
        format.html { redirect_to product_sheet_url(product_sheet.id), notice: "Ficha de Produção editado com sucesso." }
        format.json { render :show, status: :ok, location: @product_sheet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product_sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_sheet
      @production_sheet = ProductionSheet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_sheet_params
      params.require(:production_sheet).permit(:name, :date, :city, :state, :project_id, :hire_id)
    end
end
