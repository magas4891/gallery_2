ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end
    #
    # # Here is an example of a simple dashboard with columns and panels.
    # #
    h5 section 'Recently 10 Images' do

      table_for(Image.last(10)) do |image|
        image.column(:id)
        image.column(:picture) { |img| image_tag(img.picture.url, size: '150x100') }
        image.column(:name) { |item| link_to(item.title, admin_image_path(item)) }
        image.column(:category)
        image.column(:user) { |category| link_to(category.user.nick, admin_image_path(category.user)) }
      end
    end


    # h5 section "User Activity" do
    #   table_for Activity.order('user_id desc') do
    #     column :user_id
    #     column :action
    #     column :url do |activities|
    #       link_to activities.url, activities.url
    #     end
    #     column :created_at
    #
    #   end
    #
    # end






    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
