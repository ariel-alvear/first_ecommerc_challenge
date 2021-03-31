class Category < ApplicationRecord
  has_many :children_categories, class_name: "Category",
  foreign_key: "category_id"
  belongs_to :parent_category, class_name: "Category", optional: true, foreign_key: 'category_id'

  has_and_belongs_to_many :products
end
