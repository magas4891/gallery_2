ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model

# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  menu :priority => 10



  index do
    id_column
    column("Nick", :nick)
    column("E-mail", :email)
    column("Created", :created_at)
    column("Name", :name)
    actions
  end


  form do |f|
    f.inputs do
      f.input :email
      f.input :nick
      f.input :password
      f.input :password_confirmation
      f.input :name
    end
    f.actions
  end
  permit_params :email, :password, :password_confirmation, :nick, :name
end
