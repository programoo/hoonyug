class CreateStockData < ActiveRecord::Migration
  def change
    create_table :stock_data do |t|
      t.string :date
      t.decimal :assets, :precision => 15, :scale => 3
      t.decimal :liabilities, :precision => 15, :scale => 3
      t.decimal :equity, :precision => 15, :scale => 3
      t.decimal :paid_up_capital, :precision => 15, :scale => 3
      t.decimal :revenue, :precision => 15, :scale => 3
      t.decimal :net_profit, :precision => 15, :scale => 3
      t.decimal :eps, :precision => 15, :scale => 3
      t.decimal :roa, :precision => 15, :scale => 3
      t.decimal :roe, :precision => 15, :scale => 3

      t.decimal :last_price, :precision => 15, :scale => 3
      t.decimal :market_cap, :precision => 15, :scale => 3

      t.decimal :pe, :precision => 15, :scale => 3
      t.decimal :pbv, :precision => 15, :scale => 3
      t.decimal :book_value, :precision => 15, :scale => 3
      t.decimal :dividend_yield, :precision => 15, :scale => 3

      t.timestamps null: false
    end
  end
end
