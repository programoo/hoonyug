thai_market = Market.create!({name: 'Thailand'})
p thai_market
a_stock = Stock.create!(name: 'A',
                        description: 'บริษัท อารียา พรอพเพอร์ตี้ จำกัด (มหาชน)',
                        market_id: thai_market.id,
                        market_area: 'SET'
)

stock_data = StockDatum.create(stock_id: a_stock.id,
    date: '2013',
    assets: 8991.98,
    liabilities: 6133.19,
    equity: 2858.78,
    paid_up_capital: 980.00,
    revenue: 1807.77,
    net_profit: 13.78,
    eps: 0.02,
    roa: 1.47,
    roe: 0.51,
    net_profit_margin: 0.76,
    last_price: 5,
    market_cap: 4900.00,
    pe: 126.58,
    pbv: 1.71,
    book_value: 2.92,
    dividend_yield: 0.62
)