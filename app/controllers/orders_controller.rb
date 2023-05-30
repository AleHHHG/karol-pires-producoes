class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy budget_request]
  has_scope :by_project
  has_scope :by_supplier
  has_scope :by_owner
  has_scope :by_approver
  has_scope :by_status

  # GET /orders or /orders.json
  def index
    @page_title = 'Pedidos'
    @pagy, @orders = pagy(apply_scopes(Order).all.order('created_at desc'))
  end

  # GET /orders/1 or /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @page_title = 'Novo pedido'
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
    @page_title = 'Editar Pedido'
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to orders_url, notice: "Pedido criado com sucesso." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to orders_url, notice: "Pedido editado com sucesso." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /orders/1 or /orders/1.json
  def destroy
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Pedido deletado com sucesso." }
      format.json { head :no_content }
    end
  end

  # POST /orders/1/budget_request
  def budget_request
    if @order.supplier.email.blank?
      flash[:error] = "Não foi possível enviar o orçamento: Email inválido "
      redirect_to order_path(@order)
    end
    OrderMailer.with(order: @order).budget_request.deliver_now
    redirect_to order_path(@order), notice: 'Solicitação de orçamento enviada com sucesso.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:owner_id, :project_id, :supplier_id, :approver_id, :goal, :note, :status, :price, :due_date, person_ids: [])
    end
end
