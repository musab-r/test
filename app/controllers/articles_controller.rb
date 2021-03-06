module Api
	module V1

		class ArticlesController < ApplicationController
		load_and_authorize_resource
		#this line
		respond_to :json
		# before_action :authenticate_user!, except: [:index, :show]
		def index
		    # @articles = Article.all
			respond_with Article.all
		    # respond_to do |format|
		    #   format.html
		    #   format.json { render json: @articles }
		   # end
		  end


			def show
				respond_with Article.find(params[:id])
		    	#@article = Article.find(params[:id])
		    	# respond_to do |format|
			    #   format.html
			    #   format.json { render json: @article }
			   # end
		  	end

			def new
				@article = Article.new
			end

			def edit 
				@article = Article.find(params[:id])
			end

			def create
				@article = Article.new(article_params)
				# @article.user = current_user
			 	if @article.save
			  		redirect_to @article, notice: 'Article created successfully.'
			  	else
			  		render 'new'
			  	end
			end

			def update
		  		@article = Article.find(params[:id])
		 
		 	 	if @article.update(article_params)
		    		redirect_to @article,  notice: 'Article updated successfully.'
		  		else
		    		render 'edit'
		    	end

		    end

		    def destroy
		    	@article = Article.find(params[:id])
		    	@article.destroy

		    	redirect_to articles_path,  notice: 'Article deleted successfully.'
		    end
		  
			private
			  	def article_params
			    params.require(:article).permit(:title, :text)
			end

		end
	end
end