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

    # Category.destroy_all
    # 10.times do
    #   Category.create!(
    #       name: Faker::Book.title,
    #       description: Faker::Lorem.sentence(6),
    #       user_id: User.last.id
    #   )
    # end


    Dir.chdir("#{Rails.root}/lib/assets/images/")
    categories = Dir['*'].select { |f| File.directory? f }
    categories.each do |item|
      puts "Create category: #{item}" if Category.create!(name: item, user_id: 1)

      Dir.chdir("#{Rails.root.to_s}/lib/assets/images/#{item}")
      image_paths = Dir['*.*']
      category = Category.find_by(name: item)

      image_paths.each_with_index do |img_path, i|
        file_img = File.open(img_path)
        puts "\tUpload #{File.basename(img_path)}" if Image.create!(title: ('d_img_' + (i + 1).to_s),
                                                                    picture: file_img,
                                                                    user_id: 1,
                                                                    category_id: category.id)
        file_img.close
      end

    end
  end
end
