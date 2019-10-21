# frozen_string_literal: true

ActiveAdmin.register Comment, as: 'User Comments' do
  permit_params :commenter, :text, :image_id, :user_id
end
