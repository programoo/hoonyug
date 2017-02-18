class AddMarketAreaToStock < ActiveRecord::Migration
  def change
    add_column :stocks, :market_area, :string
  end
end
