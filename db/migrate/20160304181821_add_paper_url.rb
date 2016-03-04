class AddPaperUrl < ActiveRecord::Migration
  def change
    add_column :papers, :url, :string
  end
end
