namespace :update_data do
  desc "Dowload and update stock data"
  task thai: :environment do
    require 'nokogiri'
    require 'open-uri'

    def collect_objects children
      object_list = []

      children.drop(2).each_with_index do |child|

        if child.text.present?
          value = Monetize.parse(child.text, 'THB').to_d.to_f
          object_list.push(value)
        end
      end

      object_list
    end

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
          puts "assets #{link.children[3].children.text}"
          p assets_list = collect_objects(link.children)
        when 'liabilities'
          puts "liabilities #{link.children[3].children.text}"
          p assets_list = collect_objects(link.children)
        when 'equity'
          puts "equity #{link.children[3].children.text}"
          p assets_list = collect_objects(link.children)
        when 'paid-up capital'
          puts "paid-up capital #{link.children[3].children.text}"
          p assets_list = collect_objects(link.children)
        when 'revenue'
          puts "revenue #{link.children[3].children.text}"
          p assets_list = collect_objects(link.children)
        when 'net profit'
          puts "net profit #{link.children[3].children.text}"
          p assets_list = collect_objects(link.children)
        when 'eps (baht)'
          puts "eps (baht) #{link.children[3].children.text}"
          p assets_list = collect_objects(link.children)
        when 'roa(%)'
          puts "roa(%) #{link.children[3].children.text}"
          p assets_list = collect_objects(link.children)
        when 'roe(%)'
          puts "roe(%) #{link.children[3].children.text}"
          p assets_list = collect_objects(link.children)
        when 'net profit margin(%)'
          puts "net profit margin(%) #{link.children[3].children.text}"
          p assets_list = collect_objects(link.children)
        when 'statistics as of'
          puts "statistics as of #{link.children[3].children.text}"
          p assets_list = collect_objects(link.children)
        when 'last price(baht)'
          puts "last price(baht) #{link.children[3].children.text}"
          p assets_list = collect_objects(link.children)
        when 'market cap.'
          puts "market cap. #{link.children[3].children.text}"
          p assets_list = collect_objects(link.children)
        when 'p/e'
          puts "p/e #{link.children[3].children.text}"
          p assets_list = collect_objects(link.children)
        when 'p/bv'
          puts "p/bv #{link.children[3].children.text}"
          p assets_list = collect_objects(link.children)
        when 'book value per share (baht)'
          puts "book value per share (baht) #{link.children[3].children.text}"
          p assets_list = collect_objects(link.children)
        when 'dvd. yield(%)'
          puts "dvd. yield(%) #{link.children[3].children.text}"
          p assets_list = collect_objects(link.children)
      end
    end
  end
end
