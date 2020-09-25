# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  belongs_to :parent, optional: true, class_name: 'Comment'

  # Method for retrieving all related comments
  def comments
    Comment.where(commentable: commentable, parent_id: id)
  end
end
