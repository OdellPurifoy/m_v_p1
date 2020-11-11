# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.text :title, null: false, default: ''
      t.text :content, null: false, default: ''
      t.text :category, null: false, default: ''
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
