FactoryBot.define do
  factory :user do
    factory :valid_user do
      email { "bob@gmail.com" }
      password { "password" }
      password_confirmation { "password" }
      name { "Bob" }
    end
  end
  factory :category do
    factory :valid_category do
      name { "Category" }
      description { Faker::Lorem.sentence(6) }
      user_id { 1 }
    end
  end
  factory :image do
    factory :valid_image do
      title { Faker::Lorem.words }
      user_id { 1 }
      category_id { 1 }
      picture { File.open("/home/developer/RoR/gallery_2/public/uploads/image/picture/1/04.jpg") }
    end
  end
end
