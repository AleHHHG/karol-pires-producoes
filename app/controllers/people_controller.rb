class PeopleController < ApplicationController
  has_scope :by_project
  has_scope :by_name
  before_action :set_person, only: %i[ show edit update destroy ]

  # GET /people or /people.json
  def index
    @page_title = 'Colaboradores'
    @pagy, @people = pagy(apply_scopes(Person).all)
  end

  # GET /people/1 or /people/1.json
  def show
  end

  # GET /people/new
  def new
    @page_title = 'Novo Colaborador'
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
    @page_title = 'Editar Colaborador'
  end

  # POST /people or /people.json
  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to people_url, notice: 'Colaborador criado com sucesso.' }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1 or /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to people_url, notice: 'Colaborador editado com sucesso.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1 or /people/1.json
  def destroy
    if @person.orders.present?
      flash[:error] =  'Não foi possivel deletar: Colaborador vinculado a um ou mais pedidos'
      redirect_to people_url
    else
      @person.destroy
      redirect_to people_url, notice: 'Colaborador deletado com sucesso.'
    end
  end

  def import_file
    ImportPeopleService.new(params[:project_id], params[:file]).execute
    respond_to do |format|
      format.html { redirect_to people_url, notice: 'Arquivo importado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def person_params
      params.require(:person).permit(:name, :email, :rg, :cpf, :phone_number, :role, :date_of_birth, :zip_code, :country, :state, :city, :street, :neighborhood, :complement, :number, :project_id)
    end
end
