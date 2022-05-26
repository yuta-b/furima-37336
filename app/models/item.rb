class Item < ApplicationRecord
  validates :product_name,       presence: true
  validates :product_version,    presence: true
  validates :category_id,        presence: true, numericality: { other_than: 1 ,message: 'に「---」は選択不可'}
  validates :condition_id,       presence: true, numericality: { other_than: 1 ,message: 'に「---」は選択不可'}
  validates :delivery_charge_id, presence: true, numericality: { other_than: 1 ,message: 'に「---」は選択不可'}
  validates :delivery_place_id,  presence: true, numericality: { other_than: 1 ,message: 'に「---」は選択不可'}
  validates :delivery_days_id,   presence: true, numericality: { other_than: 1 ,message: 'に「---」は選択不可'}
  validates :price,              presence: true, inclusion: { only_integer: true, in: 300..9_999_999, message: "は半角数字で300〜9,999,999の範囲で入力してください" }
  validates :image,              presence: true

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :delivery_place
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :delivery_days

end