module CategoryHelper
  def top_5_categories
    categories = Category.all
    categories.each do |category|
      images = category.images
      imgs_likes_arr = []
      imgs_cmmnts_arr = []
      images.each do |f|
        imgs_likes_arr.append(f.likes.count)
        imgs_cmmnts_arr.append(f.comments.count)
      end
      category.rank = category.images.count + imgs_likes_arr.sum + imgs_cmmnts_arr.sum
      category.save!
    end
    @top_categories = Category.where("name != 'NoName'").order('rank desc').limit(5)
  end
end
