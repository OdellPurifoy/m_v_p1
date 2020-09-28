# frozen_string_literal: true

module CommentsHelper
  # Use the comment as the parent if unlimited nesting is allowed
  # Otherwise use the comments parent
  def reply_to_comment_id(comment, nesting, max_nesting)
    if max_nesting.blank? || nesting < max_nesting
      comment.id
    else
      comment.parent_id
    end
  end
end
