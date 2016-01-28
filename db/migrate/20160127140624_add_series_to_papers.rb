class AddSeriesToPapers < ActiveRecord::Migration
  def change
    add_reference :papers, :series, index: true, foreign_key: true
  end
end
