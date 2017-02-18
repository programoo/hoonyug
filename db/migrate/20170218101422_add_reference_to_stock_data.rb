class AddReferenceToStockData < ActiveRecord::Migration
  def change
    add_reference :stock_data, :stock, index: true
  end
end
