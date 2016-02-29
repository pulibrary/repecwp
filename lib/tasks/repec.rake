

namespace :repec do
  desc "Check All Paper URLs"
  task url_check: :environment do
    series_list = Series.all
    Paper.find_each do |paper|
      response = paper.check_url
      sleep 2
      unless response.nil?
        puts "#{paper.sectionurlid},#{paper.id},#{paper.format_file_url},#{response.status}"
      else
        puts "#{paper.sectionurlid},#{paper.id},#{paper.format_file_url},No URL"
      end
    end
  end

end
