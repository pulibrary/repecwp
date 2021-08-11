class AddSeriesToPapers < ActiveRecord::Migration[4.2]
  def change
    add_reference :papers, :series, index: true, foreign_key: true
  end
end
