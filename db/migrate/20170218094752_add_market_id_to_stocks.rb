class AddMarketIdToStocks < ActiveRecord::Migration
  def change
    add_reference :stocks, :market, index: true
  end
end
