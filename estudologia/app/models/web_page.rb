class WebPage < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :body, presence: true
  validates :author, presence: true
end
