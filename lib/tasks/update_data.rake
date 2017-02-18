namespace :update_data do
  desc "Dowload and update stock data"
  task thai: :environment do
    require 'nokogiri'
    require 'open-uri'

    doc = Nokogiri::HTML(open('http://www.nokogiri.org/tutorials/installing_nokogiri.html'))
    p doc
  end

end
