class WelcomeController < ApplicationController
  def index
    #variáveis de sessão
    # cookies[:curso] = "Curso de Ruby on Rails"
    # session[:curso] = "Curso de Ruby on Rails"
    @nome = params[:nome] || 'Lucas'
    @curso = params[:curso] || 'Rails'
  end
end
