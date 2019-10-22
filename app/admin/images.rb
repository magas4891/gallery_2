# frozen_string_literal: true

ActiveAdmin.register Image do
  permit_params :user_id, :category_id, :picture, :title, :remote_picture_url
end
