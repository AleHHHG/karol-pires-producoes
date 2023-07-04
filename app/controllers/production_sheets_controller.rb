class ProductionSheetsController < ApplicationController
  before_action :set_product_sheet, only: %i[ edit update print]
  skip_before_action :authenticate_user!, only: %i[ edit update ]

  # GET /product_sheets/1/edit
  def edit
    @page_title = 'Ficha de produção'
    render layout: current_user ? 'application' : 'blank'
  end

  # PATCH/PUT /product_sheets/1 or /product_sheets/1.json
  def update
    respond_to do |format|
      if @production_sheet.update(production_sheet_params)
        format.html { redirect_to edit_production_sheet_url, notice: "Ficha de Produção salva com sucesso." }
        format.json { render :show, status: :ok, location: @production_sheet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @production_sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  def print
    render layout: 'blank'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_sheet
      begin
        id = EncryptionService.new(params[:id]).decrypt
      rescue
        id = params[:id]
      end
      @production_sheet = ProductionSheet.find(id)
    end

    # Only allow a list of trusted parameters through.
    def production_sheet_params
      params.require(:production_sheet).permit(event_data_params + local_production_params + hotel_params + photo_params)
    end

    def event_data_params
      %i[ place address open_place vehicle_accesses_backstage kind opening_public lineup audience_capacity start_time ]
    end

    def local_production_params
      %i[ general_producer general_producer_phone event_holder event_holder_phone feeding_holder feeding_holder_phone 
          sound_holder sound_holder_phone lighting_holder lighting_holder_phone stage_holder stage_holder_phone 
          led_holder led_holder_phone transport_holder transport_holder_phone assistant_holder assistant_holder_phone 
          dressing_room_holder dressing_room_holder_phone security_holder security_holder_phone ]
    end

    def hotel_params
      %i[ hotel_name hotel_holder hotel_phone hotel_fax parking bus_parking hotel_city hotel_state hotel_address 
          distance checkin_time site email ]
    end

    def photo_params
      [transport_images: []]
    end
end
