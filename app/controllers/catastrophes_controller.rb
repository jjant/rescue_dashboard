class CatastrophesController < ApplicationController
  def loginPost
    if params[:email] == 'jantonielli@itba.edu.ar' && params[:password] == '123123123'
      redirect_to catastrophes_path
    else
      flash[:notice] = "Datos invalidos. Por favor revise el email y la contraseña ingresada"
      redirect_to login_catastrophes_path
    end
  end

  def index
    @catastrophes = Catastrophe.all
  end

  def show
    @catastrophe = Catastrophe.find(params[:id])
    @lat, @lng = @catastrophe.lat, @catastrophe.lng
  end
end
