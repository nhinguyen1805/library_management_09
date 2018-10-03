class Book < ApplicationRecord
  belongs_to :author
  belongs_to :publisher
  belongs_to :category
  has_many :request_details, dependent: :destroy
  has_many :user_reviews, dependent: :destroy

  scope :search, -> search {where("name LIKE ?", "%#{search}%") if search}
  scope :_page, -> page do
    paginate(page: page, per_page: Settings.book.index.per_page)
  end

  validates :name, presence: true
  validates :content, :category, presence: true
  validates :number_page, presence: true
  validates :year, presence: true
end
