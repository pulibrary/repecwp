class AddPaperUrl < ActiveRecord::Migration[4.2]
  def change
    add_column :papers, :url, :string
  end
end
