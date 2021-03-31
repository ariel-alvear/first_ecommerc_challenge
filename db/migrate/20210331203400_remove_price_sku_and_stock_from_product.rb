class RemovePriceSkuAndStockFromProduct < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :price
    remove_column :products, :stock
    remove_column :products, :sku
  end
end
