# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
  validates :title, :content, presence: true

  CATEGORIES = %w[Race Regligon Politics LGBTQ].freeze
end
