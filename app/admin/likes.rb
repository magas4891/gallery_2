# frozen_string_literal: true

ActiveAdmin.register Like do
  permit_params :image_id, :user_id
end
