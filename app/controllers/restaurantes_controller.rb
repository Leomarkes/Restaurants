class RestaurantesController < ApplicationController
  before_action :set_restaurante, only: [:edit, :update, :show, :destroy, :avaliar, :newavaliar]


  def index
    @restaurantes = Restaurante.paginate(page: params[:page], per_page: 5)
    @comentarios = Comentario.all
  end

  def new
    @restaurante = Restaurante.new
  end

  def create
    @restaurante = Restaurante.new(restaurante_params)
    if @restaurante.save
      flash[:success] = "Restaurant was successfully created"
      redirect_to root_path(@restaurante)
    else
      render 'new'
    end
  end

  def show
    @comentarios = Comentario.all
  end

  def edit

  end

  def update
    if @restaurante.update(restaurante_params)
      flash[:success] = "Restaurant was successufully updated"
      redirect_to root_path(@restaurante)
    else
      render "edit"
    end
  end

  def destroy
    @restaurante.destroy
    flash[:danger] = "Restaurante was successfully deleted"
    redirect_to root_path
  end

  def avaliar
    @comentario = Comentario.new
  end

  def newavaliar
    @comentario = Comentario.new(comentario_params)
    @comentario.restaurante = @restaurante
    @comentario.user = current_user
      if @comentario.save
        flash[:success] = "Restaurant avaliated"
        redirect_to root_path
      else
        render 'avaliar'
      end
  end

  private
    def set_restaurante
      @restaurante = Restaurante.find(params[:id])
    end

    def restaurante_params
      params.require(:restaurante).permit(:name, :description, :image)
    end

    def set_comentario
      @comentario = Comentario.find(params[:id])
    end

    def comentario_params
      params.require(:comentario).permit(:description, :nota, :restaurante_id)
    end

end
