class ArticlesController < ApplicationController
	
	 http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

	def new	 
		@article = Article.new	
	end 

	# => ver todos los articulos
	def index
		@articles = Article.all
	end

	# => crear un articulo
	def create
		@article = Article.new(article_params)
 
		if @article.save
			redirect_to @article
		else
			render 'new'
		end	
	end

	# => ver un articulo
	def show
		@article = Article.find(params[:id])
		
	end

	# => ver la vista para editar un articulo
	def edit
		@article = Article.find(params[:id])
		
	end

	#modifica el articulo
	def update
		@article = Article.find(params[:id])

		if @article.update(article_params)	
			redirect_to @article
		else
			render 'edit'
		end	
	end

	#eliminar un articulo
	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to article_path
		
	end

	private
		def article_params
			 params.require(:article).permit(:title, :text)
		end

end
