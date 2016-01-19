class CreatePapers < ActiveRecord::Migration
  def change
    create_table :papers do |t|
      t.string :title
      t.string :author1first
      t.string :author1mid
      t.string :author1last
      t.string :author1workplace
      t.string :author2first
      t.string :author2mid
      t.string :author2last
      t.string :author2workplace
      t.string :author3first
      t.string :author3mid
      t.string :author3last
      t.string :author3workplace
      t.string :author4first
      t.string :author4mid
      t.string :author4last
      t.string :author4workplace
      t.string :author5first
      t.string :author5mid
      t.string :author5last
      t.string :author5workplace
      t.text :abstract
      t.string :creationdate
      t.string :sectionurlid
      t.string :papernumber
      t.string :filefunction
      t.string :jel
      t.string :keywords
      t.boolean :suppress
      t.integer :wpid

      t.timestamps null: false
    end
  end
end
