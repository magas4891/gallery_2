# frozen_string_literal: true

ActiveAdmin.register Category do
  permit_params :user_id, :name, :description, :id

  controller do
    def find_resource
      scoped_collection.where(slug: params[:id]).first!
    rescue ActiveRecord::RecordNotFound
      scoped_collection.find(params[:id])
    end
  end
end
