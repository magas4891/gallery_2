namespace :db do

  desc "creating categories"
  task cr: :environment do
    User.destroy_all
    10.times do
      User.create!(
          email: Faker::Internet.email,
          password: Faker::Internet.password
      )
    end

    Dir.chdir("#{Rails.root}/lib/assets/images/")
    categories = Dir['*'].select { |f| File.directory? f }
    categories.each do |item|
      puts "Create category: #{item}" if Category.create!(name: item,
                                                          description: Faker::Lorem.sentence(6),
                                                          user_id: 1)

      Dir.chdir("#{Rails.root.to_s}/lib/assets/images/#{item}")
      image_paths = Dir['*.*']
      category = Category.find_by(name: item)

      image_paths.each_with_index do |img_path, i|
        file_img = File.open(img_path)
        puts "\tUpload #{File.basename(img_path)}" if Image.create!(title: ('img_' + (i + 1).to_s),
                                                                    picture: file_img,
                                                                    user_id: Faker::Number.between(1, 10),
                                                                    category_id: category.id)
        file_img.close
      end
    end

    300.times do
      Comment.create!(
                 commenter: Faker::Artist.name,
                 text: Faker::Lorem.sentence(10),
                 image_id: Faker::Number.between(1, 115),
                 user_id: Faker::Number.between(1, 10)
      )
    end
  end
end
