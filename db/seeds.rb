# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#destory all to reset seeding properly

# Product.destroy_all
# Article.destroy_all

#
ProductReview.delete_all
SubsubCategory.delete_all
Subcategory.delete_all
Category.delete_all


def create_category_tree(category_name, sub_categories)
  category = Category.create(product_type: category_name)
  sub_categories.each do |sub_category|
    sub_obj = category.subcategories.create(name: sub_category)
  end
end

create_category_tree("makeup", ['foundation', 'powders', 'eyes', 'lips', 'cheeks'])
create_category_tree("skincare", ['cleanser','toner','essence','moisturizer', 'creams', 'acne', 'wrinkles', 'pores'])


# 10.times do
#   SubsubCategory.create(
#   makeup_sscateg: ['eyeliner','eyeshadow','lipgloss','lipstick', 'mascara', 'blush', 'highlight', 'countour', 'lip balm', 'setting sprays', 'makeup remover'].sample,
#   skincare_sscateg: ['sunscreen','anti aging','oil free', 'all nautral', 'organic', 'non-gmo'].sample
#   )
# end

puts Cowsay.say("Created #{Category.count} Category", :tux)
puts Cowsay.say("Created #{Subcategory.count} Subcategory", :tux)
puts Cowsay.say("Created #{SubsubCategory.count} SubsubCategory", :tux)



10.times do

  productName = ['Laniege Water Sleeping Pack', 'Skin Food Egg White Pore Mask',
  'Clio Tinted Brow Tattoo Pen', 'Innisfree Green Tea Cleansing Foam', 'KLAIRS Freshly Juiced Vitamin C Serum', 'COSRX Galactomyces 95 Whitening Power Essence']
  rating = rand(1..5)
  brand = ['Dr.Jart+','SK-II','Clinique','Neutrogena', 'Rimmel', 'Urban Decay', 'NARS','Shiseido']
  address =  Faker::Address.street_address + ' ' + Faker::Address.city
  # onlinePurchase = ['https://www.gmarket.com', 'http://www.sephora.com', 'https://www.thefaceshop.com', 'https://www.amazon.com' ]
  # purchaseSeed = addresses.concat onlinePurchase

  product = Product.create(
    name: productName.sample,
    brand: brand.sample,
    place_of_purchase: address,
    ratings: "#{rating}",
  )

  category = Category.all.sample
  subcategory = category.subcategories.sample

  product.product_category = ProductCategory.create(product_id: product.id, category_id: category.id)
  product.product_sub_category = ProductSubCategory.create(product_id: product.id, subcategory_id: subcategory.id)
end


10.times do

  user = Faker::StarWars.character
  email = user.delete(' ').downcase
  names = user.split(' ')
  age = rand(12..60)
  country = Faker::Address.country
  firstName = Faker::Name.first_name
  lastName = Faker::Name.last_name

  User.create(
  avatar: Faker::Avatar.image("my-own-slug", "50x50"),
  email: "#{email}@gmail.com",
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  password: '0000',
  password_confirmation: '0000',
  age: "#{age}",
  country: "#{country}",

  )

end

puts Cowsay.say("Created #{User.count} User", :tux)


10.times do

    productName = ['Laniege Water Sleeping Pack', 'Skin Food Egg White Pore Mask',
    'Clio Tinted Brow Tattoo Pen', 'Innisfree Green Tea Cleansing Foam', 'KLAIRS Freshly Juiced Vitamin C Serum', 'COSRX Galactomyces 95 Whitening Power Essence']



    users = User.ids
    products = Product.ids
    category = Category.ids
    subcategory = Subcategory.ids
    subsub_category = SubsubCategory.ids

    p = ProductReview.create(
    positive_comment: Faker::Lorem.paragraph,
    negative_comment: Faker::Lorem.paragraph,
    users_id: users.sample,
    product_id: products.sample,
    images: Faker::Avatar.image
  )

end

puts Cowsay.say("Created #{ProductReview.count} ProductReview", :tux)

# 10.times do
#   Comment.create(
#   body: Faker::Lorem.sentences,
#   )
# end


BASE_TAGS = {
  skin_type: [
    "dry",
    "oily",
    "normal",
    "combination"
  ],
  eye_shape: [
    "down_turned",
    "hooded",
    "almond",
    "round_eyes"
  ],
  eye_lid: [
    "monolid",
    "doublelid"
  ],
  skin_base_tone: [
    "brown",
    "white",
    "black",
    "yellow"
  ]
}

BASE_TAGS.each do |context, tag_name|
  ActsAsTaggableOn::Tag.create(context: context, name: tag_name)
end
