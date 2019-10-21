ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do

    h5 section 'Recently 10 Images' do
      table_for(Image.last(10)) do |image|
        image.column(:id)
        image.column(:picture) do |img|
          image_tag(img.picture.url, size: '150x100')
        end
        image.column(:name) do |item|
          link_to(item.title, admin_image_path(item))
        end
        image.column(:category)
        image.column(:user) do |category|
          link_to(category.user.nick, admin_image_path(category.user))
        end
      end
    end
  end
end
