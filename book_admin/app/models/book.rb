class Book < ApplicationRecord

  enum sales_status: {
    reservation: 0,
    now_on_sale: 1,
    end_of_print: 2,
  }

  scope :costly, -> { where("price > ?", 3000)}
  scope :written_about, ->(theme) {where("name like ?", "%#{theme}%")}

  belongs_to :Publisher
  has_many :book_authors
  has_many :authors, thorouth: :book_authors

  #バリデーション↓
  validates :name, prsence: true
  validates :name, length: {maximum: 25}
  validates :price, numericality: {greater_than_or_equal_to: 0}

  #コールバック↓
  before_validation :add_lovely_to_cat
  after_destory :if => :high_price? do
    Rails.logger.warn "Book is high price is deleted: #{self.attributes}"
    Rails.logger.warn "Please check!!"
  end

  def add_lovely_to_cat
    self.name = salf.name.gsub(/Cat/) do |matched|
      "lovely #{matched}"
    end
  end

  def high_price?
    price >= 5000
  end

end
