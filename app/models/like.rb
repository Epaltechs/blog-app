class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
  after_save :update_likes_counter

  private

  #   A method that updates the likes counter for a post.

  def update_likes_counter
    post.increment(:likes_counter)
  end
end
