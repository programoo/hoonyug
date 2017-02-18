namespace :update_data do
  desc "Dowload and update stock data"
  task thai: :environment do
    require 'nokogiri'
    require 'open-uri'
    stock_name = 'A'
    doc = Nokogiri::HTML(open("http://www.set.or.th/set/companyhighlight.do?symbol=#{stock_name}&ssoPageId=5&language=en&country=US"))
    #p doc

    doc.css('tbody tr').each do |link|
      #p link
      binding.pry
      p link.children[1].children.text
      if link.children[1].children.text.downcase == 'assets'
        p link.children[3].children.text
      end

      case link.children[1].children.text.downcase
        when 'assets'
          puts "assets #{link.children[3].children.text}"
        when 'liabilities'
          puts "liabilities #{link.children[3].children.text}"
        when 'equity'
          puts "equity #{link.children[3].children.text}"
        when 'paid-up capital'
          puts "paid-up capital #{link.children[3].children.text}"
        when 'revenue'
          puts "revenue #{link.children[3].children.text}"
        when 'net profit'
          puts "net profit #{link.children[3].children.text}"
        when 'eps (baht)'
          puts "eps (baht) #{link.children[3].children.text}"
        when 'roa(%)'
          puts "roa(%) #{link.children[3].children.text}"
        when 'roe(%)'
          puts "roe(%) #{link.children[3].children.text}"
        when 'net profit margin(%)'
          puts "net profit margin(%) #{link.children[3].children.text}"
        when 'statistics as of'
          puts "statistics as of #{link.children[3].children.text}"
        when 'last price(baht)'
          puts "last price(baht) #{link.children[3].children.text}"
        when 'market cap.'
          puts "market cap. #{link.children[3].children.text}"
        when 'p/e'
          puts "p/e #{link.children[3].children.text}"
        when 'p/bv'
          puts "p/bv #{link.children[3].children.text}"
        when 'book value per share (baht)'
          puts "book value per share (baht) #{link.children[3].children.text}"
        when 'dvd. yield(%)'
          puts "dvd. yield(%) #{link.children[3].children.text}"

      end

    end
  end

end
