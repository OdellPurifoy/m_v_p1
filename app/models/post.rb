# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
  has_one_attached :main_image
  validates :title, :content, presence: true

  # validates :acceptable_image
  #
  # def acceptable_image
  #   return unless main_image.attached?
  #
  #   # Checks if image size too large
  #   unless main_image.byte_size > 5.megabyte
  #     errors.add(:main_image, 'Image too large')
  #   end
  #
  #   # Checks if image type is acceptable
  #   acceptable_image_types = ['image/jpeg', 'image/png', 'image/jpg']
  #   unless acceptable_image_types.include?(main_image.content_type)
  #     errors.add(:main_image, 'Image must be JPEG, PNG or JPG')
  #   end
  # end

  CATEGORIES = %w[Race Regligon Politics LGBTQ].freeze
end
