# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    factory :valid_user do
      email { Faker::Internet.email }
      password { 'password' }
      password_confirmation { 'password' }
      name { Faker::DcComics.name }
      nick { Faker::Food.dish }
    end
    factory :user_with_not_uniq_email do
      email { 'bob_smith@gmail.com' }
      password { 'password' }
      password_confirmation { 'password' }
      name { 'Bob' }
    end
  end
  factory :admin_user do
    factory :valid_admin_user do
      email { Faker::Internet.email }
      password { 'password' }
      password_confirmation { 'password' }
    end
  end
  factory :category do
    factory :valid_category do
      name { Faker::DcComics.hero }
      description { Faker::ChuckNorris.fact }
      user_id { User.last.id }
      slug { Faker::Internet.slug }
      rank { 0 }
    end
  end
  factory :image do
    factory :valid_image do
      title { Faker::Lorem.word }
      user_id { User.last.id }
      category_id { Category.last.id }
      picture do
        File.open('/home/developer/RoR/gallery_2/public/uploads/image/picture/167/look.com.ua-52254.jpg')
      end
    end
  end
  factory :comment do
    factory :valid_comment do
      commenter { User.last.name }
      text { Faker::Lorem.sentence(6) }
      user_id { User.last.id }
      image_id { Image.last.id }
    end
  end
  factory :follow do
    factory :valid_follow do
      user_id { User.last.id }
      category_id { Category.last.id }
    end
  end
  factory :like do
    factory :valid_like do
      user_id { User.last.id }
      image_id { Image.last.id }
    end
  end
  factory :activity do
    factory :valid_activity do
      action { 'something do' }
      url { Faker::Internet.url }
      user_id { User.last.id }
    end
  end
end
