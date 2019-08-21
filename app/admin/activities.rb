ActiveAdmin.register Activity do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
#
#
  menu :priority => 3
  actions :index

  filter :user_id
  filter :action

  index do
    selectable_column
    id_column
    column("User", :sortable => :user_id) { |user|
      sm = user.user
      link_to "#{ sm.nick }", admin_user_path(sm) }
    column("Action", :action, :sortable => :action)
    column("Url", :url, :sortable => :url) { |activities| link_to activities.url, activities.url }
    column("Date", :created_at, :sortable => :created_at)
  end


end
