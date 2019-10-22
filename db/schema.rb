# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this
#                                                   schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach
#                                                   (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your
#                                                 version control system.

ActiveRecord::Schema.define(version: 20_190_916_100_456) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'active_admin_comments', force: :cascade do |t|
    t.string 'namespace'
    t.text 'body'
    t.string 'resource_type'
    t.bigint 'resource_id'
    t.string 'author_type'
    t.bigint 'author_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[author_type author_id], name:
        'index_active_admin_comments_on_author_type_and_author_id'
    t.index ['namespace'], name: 'index_active_admin_comments_on_namespace'
    t.index %w[resource_type resource_id], name:
        'index_active_admin_comments_on_resource_type_and_resource_id'
  end

  create_table 'activities', force: :cascade do |t|
    t.string 'action'
    t.string 'url'
    t.bigint 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_activities_on_user_id'
  end

  create_table 'admin_users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.index ['email'], name: 'index_admin_users_on_email', unique: true
    t.index ['reset_password_token'], name:
        'index_admin_users_on_reset_password_token', unique: true
  end

  create_table 'categories', force: :cascade do |t|
    t.string 'name'
    t.text 'description'
    t.bigint 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'slug'
    t.integer 'rank'
    t.index ['slug'], name: 'index_categories_on_slug', unique: true
    t.index ['user_id'], name: 'index_categories_on_user_id'
  end

  create_table 'comments', force: :cascade do |t|
    t.string 'commenter'
    t.text 'text'
    t.bigint 'image_id'
    t.bigint 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['image_id'], name: 'index_comments_on_image_id'
    t.index ['user_id'], name: 'index_comments_on_user_id'
  end

  create_table 'follows', force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'category_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['category_id'], name: 'index_follows_on_category_id'
    t.index ['user_id'], name: 'index_follows_on_user_id'
  end

  create_table 'friendly_id_slugs', force: :cascade do |t|
    t.string 'slug', null: false
    t.integer 'sluggable_id', null: false
    t.string 'sluggable_type', limit: 50
    t.string 'scope'
    t.datetime 'created_at'
    t.index %w[slug sluggable_type scope], name:
        'index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope',
                                           unique: true
    t.index %w[slug sluggable_type], name:
        'index_friendly_id_slugs_on_slug_and_sluggable_type'
    t.index %w[sluggable_type sluggable_id], name:
        'index_friendly_id_slugs_on_sluggable_type_and_sluggable_id'
  end

  create_table 'images', force: :cascade do |t|
    t.string 'title'
    t.bigint 'category_id'
    t.bigint 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'picture'
    t.index ['category_id'], name: 'index_images_on_category_id'
    t.index ['user_id'], name: 'index_images_on_user_id'
  end

  create_table 'likes', force: :cascade do |t|
    t.bigint 'image_id'
    t.bigint 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['image_id'], name: 'index_likes_on_image_id'
    t.index ['user_id'], name: 'index_likes_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer 'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.inet 'current_sign_in_ip'
    t.inet 'last_sign_in_ip'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'provider'
    t.string 'uid'
    t.string 'name'
    t.text 'image'
    t.string 'nick'
    t.integer 'failed_attempts', default: 0
    t.string 'unlock_token'
    t.datetime 'locked_at'
    t.integer 'cached_failed_attempts', default: 0
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name:
        'index_users_on_reset_password_token', unique: true
    t.index ['unlock_token'], name: 'index_users_on_unlock_token', unique: true
  end

  add_foreign_key 'activities', 'users'
  add_foreign_key 'categories', 'users'
  add_foreign_key 'comments', 'images'
  add_foreign_key 'comments', 'users'
  add_foreign_key 'follows', 'categories'
  add_foreign_key 'follows', 'users'
  add_foreign_key 'images', 'categories'
  add_foreign_key 'images', 'users'
  add_foreign_key 'likes', 'images'
  add_foreign_key 'likes', 'users'
end
