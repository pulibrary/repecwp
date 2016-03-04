require 'faraday'

class Paper < ActiveRecord::Base
  require 'csv'

  belongs_to :series

  def self.import(csv_string)
    CSV.foreach(csv_string, headers: true) do |row|
      Paper.create! row.to_hash
    end
  end

  def format_file_url
    unless self.series_id.blank?
      series = Series.find(self.series_id)
      "#{series.base_url}#{self.papernumber}"
    end
  end

  def check_url
    unless self.url.nil?
      Faraday.get(self.url)
    end
  end
end
