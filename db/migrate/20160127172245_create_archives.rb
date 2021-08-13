class CreateArchives < ActiveRecord::Migration[4.2]
  def change
    create_table :archives do |t|
      t.string :handle
      t.string :name
      t.string :maintainer_email
      t.text :description
      t.string :url

      t.timestamps null: false
    end
  end
end
