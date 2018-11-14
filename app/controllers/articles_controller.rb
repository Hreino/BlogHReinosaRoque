class ArticlesController < ApplicationController
     #GET /articles
     def index
          #para que las variables esten disponibles en la vista y en los controladores
          #, deben estar declaradas con un '@'
          @articles =Article.all
     end

     def show
          @article = Article.find(params[:id])
     end

     def new
          @article = Article.new
     end
     
end
