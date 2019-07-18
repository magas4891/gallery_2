namespace :db do

  # desc "creating users"
  # task create_users: :environment do
  #   User.destroy_all
  #   10.times do
  #     User.create!(
  #         email: Faker::Internet.email,
  #         password: Faker::Internet.password
  #     )
  #   end
  # end
  #
  # desc "creating category"
  # task create_category: :environment do
  #   Category.destroy_all
  #   10.times do
  #     Category.create!(
  #         title: Faker::Creature::Animal.name,
  #         description: Faker::Lorem.sentence(6),
  #         user_id: User.last.id
  #     )
  #   end
  # end

  desc "creating category"
  task cr: :environment do
    User.destroy_all
    10.times do
      User.create!(
          email: Faker::Internet.email,
          password: Faker::Internet.password
      )
    end

    Gallery.destroy_all
    10.times do
      Gallery.create!(
          title: Faker::Book.title,
          description: Faker::Lorem.sentence(6),
          user_id: User.last.id
      )
    end

  end
end
