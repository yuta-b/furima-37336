class Item < ApplicationRecord
  validates :product_name,       presence: true
  validates :product_version,    presence: true
  validates :category_id,        presence: true
  validates :condition_id,       presence: true
  validates :delivery_charge_id, presence: true
  validates :delivery_place_id,  presence: true
  validates :delivery_days_id,   presence: true
  validates :price,              presence: true
  validates :image,              presence: true

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :category_id, numericality: { other_than: 1 , message: "cant' be blank" }
  validates :condition_id, numericality: { other_than: 1 , message: "cant' be blank" }
  validates :delivery_charge_id, numericality: { other_than: 1 , message: "cant' be blank" }
  validates :delivery_place_id, numericality: { other_than: 1 , message: "cant' be blank" }
  validates :delivery_days_id, numericality: { other_than: 1 , message: "cant' be blank" }
  belongs_to :delivery_place
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :delivery_days
end