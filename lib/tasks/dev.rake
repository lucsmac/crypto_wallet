namespace :dev do
  desc "Config development environment"
  task setup: :environment do
    if Rails.env.development?
      show_spinner('Drop DB') { %x(rails db:drop) }
      show_spinner('Create DB') { %x(rails db:create) }
      show_spinner('Migrate DB') { %x(rails db:migrate) }
      show_spinner('Seed DB') { %x(rails db:seed) }
    else
      puts "You aren't on development environment"
    end
  end

  private
    def show_spinner(msg_start, msg_end = 'OK')
      spinner = TTY::Spinner.new("[:spinner] #{msg_start}...")
      spinner.auto_spin
      yield
      spinner.success("(#{msg_end})")
    end
end
