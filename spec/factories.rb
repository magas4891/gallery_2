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
  factory :comment do
    factory :valid_comment do
      commenter { Faker::Internet::name }
      text { Faker::Lorem.sentence(6) }
      image_id { 1 }
      user_id { 1 }
    end
  end
  factory :follow do
    factory :valid_follow do
      user_id { 1 }
      category_id { 1 }
    end
  end
  factory :like do
    factory :valid_like do
      user_id { 1 }
      image_id { 1 }
    end
  end
end
