class ArticlesController < ApplicationController
    http_basic_authenticate_with name: "kiibo", password: "kiibo", except: [:index, :show]
 helper_method :avg 
 def new
    @article = Article.new 
  end
  def avg(id)
      a = 0
      sum =0
      value = 0  
      @article = Article.find(id)
      @article.ratings.all.each do |rat|
           a= a+ 1
           sum  = sum +  rat.rating         
      end
   if sum != 0 
      '%.2f' % value =  sum / a.to_f 
   else 
       value = 0  
   end 
end 
  def destroy
     @article = Article.find(params[:id])
     @article.destroy
 
     redirect_to articles_path
  end
  def edit
     @article = Article.find(params[:id])
  end
  def update
     @article = Article.find(params[:id])
 
     if @article.update(article_params)
        redirect_to @article
     else 
        render 'edit'
     end
  end 
  def create
     @article = Article.new(article_params)
      if @article.save
        redirect_to @article
      else
        render 'new'
      end 
  end
  def index
    @articles = Article.all
  end 
  def show
    @article = Article.find(params[:id])
  end
  
private
  def article_params
    params.require(:article).permit(:title, :text)


  end





end
