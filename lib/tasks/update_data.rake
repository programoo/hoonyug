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
    end
  end

end
