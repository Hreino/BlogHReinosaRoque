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

     def create
          @article = Article.new(article_params)
          if @article.save
            flash[:success] = "Articulo publicado exitosamente"
            redirect_to @article
          else
            flash[:error] = "Algo salio mal, el post no fue publicado"
            render 'new'
          end
     end

     def destroy
          @article = Article.find(params[:id])
          if @article.destroy #elimina el objeto de la base de datos
               flash[:success] = 'Article was successfully deleted.'
               redirect_to articles_url
          else
               flash[:error] = 'Something went wrong'
               redirect_to articles_url
          end
     end
     def edit
          @article = Article.find(params[:id])
     end
     

     def update
          @article = Article.find(params[:id])
         if @article.update_attributes(article_params)
           flash[:success] = "Article was successfully updated"
           redirect_to @article
         else
           flash[:error] = "Something went wrong"
           render 'edit'
         end
     end
     
     #Strong params
     private
     def article_params
          #permit quiere decir que solo esos parametros se pueden recibir en el controlador
          params.require(:article).permit(:title, :content)
     end
     
     
end
