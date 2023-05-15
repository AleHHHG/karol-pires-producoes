class ApproversController < ApplicationController
  before_action :set_approver, only: %i[ show edit update destroy ]

  # GET /approvers or /approvers.json
  def index
    @approvers = Approver.all
  end

  # GET /approvers/1 or /approvers/1.json
  def show
  end

  # GET /approvers/new
  def new
    @approver = Approver.new
  end

  # GET /approvers/1/edit
  def edit
  end

  # POST /approvers or /approvers.json
  def create
    @approver = Approver.new(approver_params)

    respond_to do |format|
      if @approver.save
        format.html { redirect_to approvers_url, notice: "Aprovador criado com sucesso." }
        format.json { render :show, status: :created, location: @approver }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @approver.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /approvers/1 or /approvers/1.json
  def update
    respond_to do |format|
      if @approver.update(approver_params)
        format.html { redirect_to approvers_url, notice: "Aprovador editado com sucesso." }
        format.json { render :show, status: :ok, location: @approver }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @approver.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /approvers/1 or /approvers/1.json
  def destroy
    @approver.destroy

    respond_to do |format|
      format.html { redirect_to approvers_url, notice: "Approvador deletado com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_approver
      @approver = Approver.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def approver_params
      params.require(:approver).permit(:name)
    end
end
