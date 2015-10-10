class ArticlesController < ApplicationController
  #validates :phone_number, presence: true 
  def new
    @article=Article.new
  end
  
  def create
      #render plain: params[:article].inspect
   
      #@article = Article.create(article_params)
      @article=Article.new(article_params)
      
    if @article.save 
      phone_num = params[:article][:phone_number]
  
      account_sid = 'ACa5318e7db84ed99e5a2bbb26f999de8e'
      auth_token = '176b516a5cf1090f99f24d9afaa47331'
      @client = Twilio::REST::Client.new account_sid, auth_token
  
      from = '+16092073156' # Your Twilio number
      #to = '+16099334843'
      to = phone_num
      to = to.tr("(", "")
      to = to.tr(")", "")
      to = to.tr("-", "")
      to = to.tr("=", "")
      to = to.to_i

      @client.account.messages.create(
      :from => from,
      :to => to,
      :body => 'Hey, Monkey party at 6PM. Bring Bananas!'
      )
      redirect_to @article
    else
      render "/new"
    end
    
  end
  
  def show
  end

  
  private
  def article_params    
    params.require(:article).permit(:phone_number)
  end  
  
  
end

