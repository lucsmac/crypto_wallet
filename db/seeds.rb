# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

coins = [
  {
    description: 'Bitcoin',
    acronym: 'BTC',
    url_image: 'https://i.pinimg.com/originals/ef/da/8b/efda8b6316786f2ff349f3065974249b.jpg'
  },
  {
    description: 'Ethereum',
    acronym: 'ETH',
    url_image: 'https://marcas-logos.net/wp-content/uploads/2020/03/ETHEREUM-LOGO.png'
  }
]

spinner = TTY::Spinner.new("[:spinner] Creating coins...")
spinner.auto_spin
coins.each do |coin|
  Coin.find_or_create_by!(coin)
end
spinner.success("(Coins created!)")
