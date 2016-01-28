class Paper < ActiveRecord::Base
  require 'csv'

  belongs_to :series

  def self.import(csv_string)
    CSV.foreach(csv_string, headers: true) do |row|
      Paper.create! row.to_hash
    end
  end

end
