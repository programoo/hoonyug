require 'nokogiri'
require 'open-uri'

namespace :refresh do
  def collect_objects children, type='unknown'
    object_list = []

    children.drop(2).each_with_index do |child|

      if child.text.present?
        if type == 'date'
          object_list.push(child.text)
        else
          value = Monetize.parse(child.text, 'THB').to_d.to_f
          object_list.push(value)
        end
      end
    end

    object_list
  end

  desc "Dowload and update stock data"
  task stocks: :environment do
    market = Market.create!({name: 'Stock exchange of Thailand'})
    Stock.destroy_all

    ('a'..'b').to_a.each do |prefix|
      doc = Nokogiri::HTML(open("http://www.set.or.th/set/commonslookup.do?language=en&country=US&prefix=#{prefix}"))
      doc.children[1].css('table tr').drop(2).each do |link|
        symbol = link.children[1].children.text
        full_name = link.children[3].children.text
        market_area = link.children[5].children.text

        Stock.create!({
                          symbol: symbol,
                          name: full_name,
                          market_area: market_area,
                          market_id: market.id
                      })
      end
    end
  end

  task stock_data: :environment do
    StockDatum.destroy_all

    stock_name = 'A'
    doc = Nokogiri::HTML(open("http://www.set.or.th/set/companyhighlight.do?symbol=#{stock_name}&ssoPageId=5&language=en&country=US"))

    assets_list = []
    liabilities_list = []
    equity_list = []
    paid_up_capital_list = []
    revenue_list = []
    net_profit_list = []
    eps_list = []
    roa_list = []
    roe_list = []
    net_profit_margin_list = []
    statistic_list = []
    last_price_list = []
    market_cap_list = []
    pe_list = []
    pbv_list = []
    book_per_share_list = []
    dvd_yield_list = []

    doc.css('tbody tr').each do |link|
      case link.children[1].children.text.downcase
        when 'assets'
          assets_list = collect_objects(link.children)
        when 'liabilities'
          liabilities_list = collect_objects(link.children)
        when 'equity'
          equity_list = collect_objects(link.children)
        when 'paid-ucapital'
          paid_up_capital_list = collect_objects(link.children)
        when 'revenue'
          revenue_list = collect_objects(link.children)
        when 'net profit'
          net_profit_list = collect_objects(link.children)
        when 'eps (baht)'
          eps_list = collect_objects(link.children)
        when 'roa(%)'
          roa_list = collect_objects(link.children)
        when 'roe(%)'
          roe_list = collect_objects(link.children)
        when 'net profit margin(%)'
          net_profit_margin_list = collect_objects(link.children)
        when 'statistics as of'
          statistic_list = collect_objects(link.children, 'date')
        when 'last price(baht)'
          last_price_list = collect_objects(link.children)
        when 'market cap.'
          market_cap_list = collect_objects(link.children)
        when 'p/e'
          pe_list = collect_objects(link.children)
        when 'p/bv'
          pbv_list = collect_objects(link.children)
        when 'book value per share (baht)'
          book_per_share_list = collect_objects(link.children)
        when 'dvd. yield(%)'
          dvd_yield_list = collect_objects(link.children)
      end
    end

    # put data into db
    statistic_list.each_with_index do |data, index|
      params = {date: data,
                assets: assets_list[index],
                liabilities: liabilities_list[index],
                equity: equity_list[index],
                paid_up_capital: paid_up_capital_list[index],
                revenue: revenue_list[index],
                net_profit: net_profit_list[index],
                net_profit_margin: net_profit_margin_list[index],
                eps: eps_list[index],
                roa: roa_list[index],
                roe: roe_list[index],
                last_price: last_price_list[index],
                market_cap: market_cap_list[index],
                pe: pe_list[index],
                pbv: pbv_list[index],
                book_value: book_per_share_list[index],
                dividend_yield: dvd_yield_list[index]
      }

      StockDatum.create!(params)
    end
  end
end
