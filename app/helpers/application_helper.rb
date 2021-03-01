module ApplicationHelper
  def date_br(date_us)
    date_us.strftime('%d/%m/%Y')
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
