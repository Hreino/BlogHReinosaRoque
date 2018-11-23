class ArticlesController < ApplicationController
     #GET /articles
     before_action :authenticate_user!

     def index
          # Ordenando articulos de forma descendente
          @articles =Article.all.order("created_at DESC")
     end

     def show
          @article = Article.find(params[:id])
          # Actualizando la cantidad de visistas
          @article.update_visits
          @comment = Comment.new
     end

     def new
          @article = Article.new
     end

     def create
          # Creando articulo asociado al  usuario en sesion
          @article = current_user.articles.new(article_params)
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
           flash[:success] = "Articulo modificado Exitosamente"
           redirect_to @article
         else
           flash[:error] = "Articulo no modificado"
           render 'edit'
         end
     end

    def myarticles
          #ordenando desde el ultimo al primero
         @articles = current_user.articles.order("created_at DESC")
    end
    
     
     
     #Strong params
     private
     def article_params
          #permit quiere decir que solo esos parametros se pueden recibir en el controlador
          params.require(:article).permit(:title, :content)
     end
     
     
end
