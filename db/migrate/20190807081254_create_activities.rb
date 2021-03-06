# frozen_string_literal: true

class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.string :action
      t.string :url
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
