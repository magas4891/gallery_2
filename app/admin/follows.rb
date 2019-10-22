# frozen_string_literal: true

ActiveAdmin.register Follow do
  permit_params :user_id, :category_id
end
