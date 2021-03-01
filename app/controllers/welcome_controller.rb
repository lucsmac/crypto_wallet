class WelcomeController < ApplicationController
  def index
    #variáveis de sessão
    @nome = params[:nome]
    @curso = params[:curso]
  end
end
