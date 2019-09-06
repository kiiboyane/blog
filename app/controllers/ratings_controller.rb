class RatingsController < ApplicationController
 def create
    @article = Article.find(params[:article_id])
    @comment = @article.ratings.create(rating_params)
    redirect_to article_path(@article)
  end
 
  private
    def rating_params
      params.require(:rating).permit(:rating)
    end
end
