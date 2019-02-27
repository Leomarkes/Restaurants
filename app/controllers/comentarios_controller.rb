class ComentariosController < ApplicationController

  before_action :set_comentario, only: [:edit, :update, :destroy]

  def edit

  end

  def update
    if @comentario.update(comentario_params)
      flash[:success] = "Your avaliation was updated successfully"
      redirect_to root_path
    else
      render 'edit'
    end
  end


  def destroy
    @comentario.destroy
    flash[:danger] = "Avaliation was successfully deleted"
    redirect_to root_path
  end

  private

  def comentario_params
    params.require(:comentario).permit(:description, :nota)
  end

  def set_comentario
    @comentario = Comentario.find(params[:id])
  end

end
