class HomeController < ApplicationController
  def index
    # Variable para mostrar la cantidad de usuarios en la plataforma
    @users =User.all
    # Variable para mostrar la cantidad de articulos en la plataforma una vez que el usuario ha iniciado sesion
    @articles = Article.all
  end
end
