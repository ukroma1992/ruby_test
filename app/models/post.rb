class Post < ApplicationRecord
  belongs_to :category

  scope :url_not_nil, -> { where.not(url: nil) }

  after_save :set_title, on: :create

  private 

  def set_title 
    self.title = "Title #{self.id}" if self.title.blank?
  end

  def self.destroy_post
    posts = Post.where.not(created_at: 5.minutes.ago..Time.now)

    posts.each do |post|
      post.update_column(:url, nil)
    end
  end
end
