namespace :dev do
  desc "Config development environment"
  task setup: :environment do
    if Rails.env.development?
      show_spinner('Drop DB') { %x(rails db:drop) }
      show_spinner('Create DB') { %x(rails db:create) }
      show_spinner('Migrate DB') { %x(rails db:migrate) }
      %x(rails dev:add_mining_types)
      %x(rails dev:add_coins)
    else
      puts "You aren't on development environment"
    end
  end

  desc "Add coins"
  task add_coins: :environment do
    coins = [
      {
        description: 'Bitcoin',
        acronym: 'BTC',
        url_image: 'https://i.pinimg.com/originals/ef/da/8b/efda8b6316786f2ff349f3065974249b.jpg',
        mining_type: MiningType.find_by(acronym: 'PoW')
      },
      {
        description: 'Ethereum',
        acronym: 'ETH',
        url_image: 'https://marcas-logos.net/wp-content/uploads/2020/03/ETHEREUM-LOGO.png',
        mining_type: MiningType.all.sample
      },
      {
        description: 'Dash',
        acronym: 'DASH',
        url_image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJjxPI-bYEzFIskb9_PAn6dn13bSWF2S4FVw&usqp=CAU',
        mining_type: MiningType.all.sample
      },
      {
        description: 'Iota',
        acronym: 'IOT',
        url_image: 'https://cryptologos.cc/logos/iota-miota-logo.png',
        mining_type: MiningType.all.sample
      },
      {
        description: 'ZCash',
        acronym: 'ZEC',
        url_image: 'https://globalcoinresearch.com/wp-content/uploads/2019/03/zcash-icon-fullcolor.png',
        mining_type: MiningType.all.sample
      }
    ]

    show_spinner("Add coins") do
      coins.each do |coin|
        Coin.find_or_create_by!(coin)
      end
    end
  end

  desc "Add mining types"
  task add_mining_types: :environment do
    mining_types = [
      {
        description: 'Proof of Work',
        acronym: 'PoW',
      },
      {
        description: 'Proof of Stake',
        acronym: 'PoS',
      },
      {
        description: 'Proof of Capacity',
        acronym: 'PoC',
      },
    ]

    show_spinner("Add mining types") do
      mining_types.each do |mining_type|
        MiningType.find_or_create_by!(mining_type)
      end
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
