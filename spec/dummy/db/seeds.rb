# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

    ['Antigua and Barbuda',
    'Australia',
    'Austria',
    'Azerbaijan',
    'Bahamas, The',
    'Belarus',
    'Bosnia and Herzegovina',
    'Bulgaria',
    'Canada',
    'Chile',
    'China',
    'Croatia',
    'Cyprus',
    'Czech Republic',
    'Denmark',
    'Estonia',
    'Finland',
    'France',
    'Georgia',
    'Germany',
    'Indonesia',
    'Ireland',
    'Israel',
    'Italy',
    'Japan',
    'Jordan',
    'Kazakhstan',
    'Korea, North',
    'Korea, South',
    'Kyrgyzstan',
    'Latvia',
    'Lebanon',
    'Lesotho',
    'Liberia',
    'Libya',
    'Liechtenstein',
    'Lithuania',
    'Luxembourg',
    'Netherlands',
    'New Zealand',
    'Poland',
    'Portugal',
    'Romania',
    'Singapore',
    'Slovakia',
    'Slovenia',
    'Spain',
    'Sudan',
    'Swaziland',
    'Sweden',
    'Switzerland',
    'Turkey',
    'Turkmenistan',
    'Ukraine',
    'United Arab Emirates',
    'United Kingdom'].each do |country|
    ShoppingCart::Country.create(name: country)
  end

ShoppingCart::Delivery.create([{ company: 'Ukrpost', delivery_method: 'Ground', price: 1 },
{ company: 'New post', delivery_method: 'Ground', price: 1.5 },
{ company: 'New post', delivery_method: 'Air', price: 5 }])

ShoppingCart::Address.create(first_name: FFaker::Name.first_name,
              last_name: FFaker::Name.last_name,
              street: FFaker::Internet.email,
              zipcode: '123456',
              phone: '123456')

ShoppingCart::CreditCard.create(number: '123456',
                  cvv: 123,
                  expiration_month: 'qwerty',
                  expiration_year: 2018)

#10.times do
#  User.create(first_name: FFaker::Name.first_name,
#              last_name: FFaker::Name.last_name,
#              email: FFaker::Internet.email,
#              password: '123456')
#end

#categories = [
#  'Web development',
#  'Fantasy',
#  'Cookbooks',
#  'Horror',
#  'Dictionnaries',
#  'Drama'].map do |name|
#    { name => Category.create(name: name) }
#  end.reduce(:merge)

#25.times do
#  Author.create(
#  first_name: FFaker::Name.first_name,
#  last_name: FFaker::Name.last_name,
#  description: FFaker::CheesyLingo.paragraph(rand(30..40)))
#end

books = [
  {title: 'JavaScript&jQuery', image: File.open("#{Rails.root}/app/assets/images/javascript_jquery.png")},
  {title: 'IT', image: File.open("#{Rails.root}/app/assets/images/it.png")},
  {title: 'Flowers for Algernon', image: File.open("#{Rails.root}/app/assets/images/algernon_flowers.jpg")},
  {title: 'Cujo', image: File.open("#{Rails.root}/app/assets/images/cujo.jpeg")},
  {title: 'Desperation', image: File.open("#{Rails.root}/app/assets/images/desperation.jpg")},
  {title: 'Fahrenheit 451', image: File.open("#{Rails.root}/app/assets/images/fahrenheit451.jpg")},
  {title: 'Revival', image: File.open("#{Rails.root}/app/assets/images/revival.jpg")},
  {title: 'Something Wicked', image: File.open("#{Rails.root}/app/assets/images/something_wicked.jpeg")},
  {title: 'Enterprise web development', image: File.open("#{Rails.root}/app/assets/images/web_dev.png")},
  {title: 'The truth about html5', image: File.open("#{Rails.root}/app/assets/images/web_development.jpg")},
  {title: 'Easy baking', image: File.open("#{Rails.root}/app/assets/images/easy_baking.jpg")},
  {title: 'Cookbook', image: File.open("#{Rails.root}/app/assets/images/cookbook.jpg")},
  {title: 'Vegetarian cookbook', image: File.open("#{Rails.root}/app/assets/images/vegetarian_cookbook.jpg")}
  ].map do |book|
    { book[:title] => Book.create(
      title: book[:title],
      short_description: FFaker::CheesyLingo.paragraph(rand(5..10)),
      full_description: FFaker::CheesyLingo.paragraph(rand(30..40)),
      image: book[:image],
      price: rand(1.0..30.0).round(2),
      instock: rand(100..1000)) }
  end.reduce(:merge)

#[{code: '123456'},
# {code: '654321'},
# {code: '321654'}].each do |coupon|
#  Coupon.create(code: coupon[:code],
#                sale: rand(3..15))

#User.create([{first_name: 'Test', last_name: 'Test', email: 'test@test.test', password: '123456' },
#  {first_name: 'Admin', last_name: 'Admin', email: 'admin@admin.admin', password: '123456', admin: true },
#  {first_name: 'Guest', last_name: 'Guest', email: 'login@login.login', password: 'password'}])
#end
