# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

CSV.foreach("#{Rails.root}/db/paper_seeds_w_blanks.csv", skip_blanks: true, :headers => true) do |row|
  Paper.create!(row.to_hash)
end

CSV.foreach("#{Rails.root}/db/series_seeds.csv", :headers => true) do |row|
  Series.create!(row.to_hash)
end

CSV.foreach("#{Rails.root}/db/archives_seeds.csv", :headers => true) do |row|
  Archive.create!(row.to_hash)
end

series = Series.all
series.each do |ser|
  papers = Paper.where(sectionurlid: ser.sectionurlid)
  papers.each do |p| 
    p.series_id = ser.id
    p.save 
  end
end

# ADD URLS
Paper.find_each do |paper|
  if !paper.papernumber.nil? 
    old_number = paper.papernumber
    paper.url = paper.format_file_url
    paper.save!
    puts "Added URL #{old_number} => #{paper.papernumber}"
  end
end


