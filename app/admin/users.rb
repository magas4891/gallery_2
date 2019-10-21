# frozen_string_literal: true

ActiveAdmin.register User do
  menu priority: 10

  index do
    id_column
    column('Nick', :nick)
    column('E-mail', :email)
    column('Created', :created_at)
    column('Name', :name)
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
