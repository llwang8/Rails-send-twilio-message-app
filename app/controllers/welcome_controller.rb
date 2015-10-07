class WelcomeController < ApplicationController
  def index
    redirect_to url_for(:controller => 'articles', :action => 'new')
  end
end
