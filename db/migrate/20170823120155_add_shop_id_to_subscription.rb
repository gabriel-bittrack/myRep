class AddShopIdToSubscription < ActiveRecord::Migration[5.1]
  def change
    add_column :subscriptions, :shop_id, :integer, null: false
  end
end
