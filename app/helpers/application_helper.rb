module ApplicationHelper
  #custom helper 
  def date_br(date_us)
    date_us.strftime('%d/%m/%Y')
  end

  def locale
    I18n.locale == 'en' ? 'Inglês' : 'Português'
  end

  def rails_env
    if Rails.env.development?
      "desenvolvimento"
    elsif Rails.env.production?
      "produção"
    else Rails.env.test?
      "teste"
    end
  end
end
