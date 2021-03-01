class WelcomeController < ApplicationController
  def index
    #variáveis de sessão
    @nome = params[:nome] || 'Lucas'
    @curso = params[:curso] || 'Rails'
  end
end
