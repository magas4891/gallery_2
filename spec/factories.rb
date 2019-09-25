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
  # factory :image do
  #   factory :valid_image do
  #     title { "best_picture_ever" }
  #     category_id { "2" }
  #     user_id { "1" }
  #   end
  # end
end
