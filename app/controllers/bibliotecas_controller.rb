class BibliotecasController < ApplicationController
  before_action :set_biblioteca, only: %i[ show edit update destroy ]

  # GET /bibliotecas or /bibliotecas.json
  def index
    @bibliotecas = Biblioteca.all
    @libros = Libro.where("id in (1, 2, 3, 4, 5)")
    @autors = Autor.where("id in (1, 2, 3)")
    @autor_mas_de_1 = Autor.find(5)
  end

  # GET /bibliotecas/1 or /bibliotecas/1.json
  def show
    @libros = Libro.all
    @relaciones_biblioteca = @biblioteca.relacion_bibliotecas
  end

  # GET /bibliotecas/new
  def new
    @biblioteca = Biblioteca.new
  end

  # GET /bibliotecas/1/edit
  def edit
  end

  # POST /bibliotecas or /bibliotecas.json
  def create
    @biblioteca = Biblioteca.new(biblioteca_params)

    respond_to do |format|
      if @biblioteca.save
        format.html { redirect_to @biblioteca, notice: "Biblioteca was successfully created." }
        format.json { render :show, status: :created, location: @biblioteca }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @biblioteca.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bibliotecas/1 or /bibliotecas/1.json
  def update
    respond_to do |format|
      if @biblioteca.update(biblioteca_params)
        format.html { redirect_to @biblioteca, notice: "Biblioteca was successfully updated." }
        format.json { render :show, status: :ok, location: @biblioteca }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @biblioteca.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bibliotecas/1 or /bibliotecas/1.json
  def destroy
    @biblioteca.destroy!

    respond_to do |format|
      format.html { redirect_to bibliotecas_path, status: :see_other, notice: "Biblioteca was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def crear_relacion
    relacion_BL = {biblioteca_id:params[:biblioteca_id], libro_id:params[:libro_id]}

    @relacion = RelacionBiblioteca.new(relacion_BL)
    if @relacion.save
      redirect_to biblioteca_path(params[:biblioteca_id], error:false)
    else
      redirect_to biblioteca_path(params[:biblioteca_id], error:true)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_biblioteca
      @biblioteca = Biblioteca.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def biblioteca_params
      params.require(:biblioteca).permit(:nombre, :estado)
    end

end
