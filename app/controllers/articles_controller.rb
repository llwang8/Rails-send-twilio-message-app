class ArticlesController < ApplicationController
  def new
    
  end
  
  def create
    @article = Article.new(params[:article])
    phone_num = @article["phone_number"]

    account_sid = 'ACa5318e7db84ed99e5a2bbb26f999de8e'
    auth_token = '176b516a5cf1090f99f24d9afaa47331'
    @client = Twilio::REST::Client.new account_sid, auth_token

    from = '+16092073156' # Your Twilio number
    #to = '+16099334843'
    to = phone_num
    to = to.gsub("(", "")
    to = to.gsub(")", "")
    to = to.gsub("-", "")
    to = to.gsub("/", "")
    to = to.gsub("*", "")
    to = to.gsub("%", "")
    to = to.gsub(/\s+/, "")
    to = to.to_i

    @client.account.messages.create(
    :from => from,
    :to => to,
    :body => 'Hey, Monkey party at 6PM. Bring Bananas!'
    )
  end
  
end
