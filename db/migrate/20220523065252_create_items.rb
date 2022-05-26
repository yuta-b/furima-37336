class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :product_name,       null: false
      t.string     :product_version,    null: false
      t.integer    :category_id,        null: false
      t.integer    :condition_id,       null: false
      t.integer    :delivery_charge_id, null: false
      t.integer    :delivery_place_id,  null: false
      t.integer    :delivery_days_id,   null: false
      t.integer    :price,              null: false
      t.references :user,               null: false, foreign_key: true

      t.timestamps
    end
  end
end
