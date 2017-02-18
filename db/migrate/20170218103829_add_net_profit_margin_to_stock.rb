class AddNetProfitMarginToStock < ActiveRecord::Migration
  def change
    add_column :stock_data, :net_profit_margin, :decimal, :precision => 15, :scale => 3
  end
end
