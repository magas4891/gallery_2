FactoryBot.define do
  factory :user do
    factory :valid_user do
      email { "bob@gmail.com" }
      password { "password" }
      password_confirmation { "password" }
      name { "Bob" }
    end
  #
  #   factory :user_without_email do
  #     password { "password" }
  #     password_confirmation { "password" }
  #     name { "Bob" }
  #   end
  #
  #   factory :user_without_password do
  #     email { "bob@gmail.com" }
  #     name { "Bob" }
  #   end
  #
  #   factory :user_without_name do
  #     email { "bob@gmail.com" }
  #     password { "password" }
  #     password_confirmation { "password" }
  #   end
  end
end
