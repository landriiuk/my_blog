class Article < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :title, :text, :image, presence: true

  def prev
    Article.where("id < ?", id).order(id: :desc).limit(1).first
  end

  def next
    Article.where("id > ?", id).order(id: :asc).limit(1).first
  end
end
