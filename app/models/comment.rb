class Comment < ApplicationRecord
  belongs_to :blog

  validate :blog_must_be_published

  def blog_must_be_published
    return if blog&.published?

    errors.add(:blog, "must be published to add comments")
  end
end
