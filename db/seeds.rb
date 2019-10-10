ActiveRecord::Base.connection.execute(
  'TRUNCATE app_options RESTART IDENTITY CASCADE'
)
AppOption.create!(
  [
    { option_name: 'name', option_value: 'Belanja API Demo' },
    { option_name: 'version', option_value: '1.0.0' }
  ]
)

ActiveRecord::Base.connection.execute(
  'TRUNCATE products RESTART IDENTITY CASCADE'
)
Product.create!(
  [
    {
      name: 'Sandal Mahal',
      price: 5_000_000,
      image: 'https://anu.com/images/sandal-mahal.jpg'
    },
    {
      name: 'Baju Mahal',
      price: 8_000_000,
      image: 'https://anu.com/images/baju-mahal.jpg'
    }
  ]
)
