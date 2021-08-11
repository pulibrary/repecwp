class CreateSeries < ActiveRecord::Migration[4.2]
  def change
    create_table :series do |t|
      t.string :name
      t.string :provider_name
      t.string :provider_homepage
      t.string :provider_institution
      t.string :maintainer_name
      t.string :maintainer_email
      t.string :series_type
      t.string :handle
      t.string :sectionurlid
      t.string :base_url
      t.string :pri_handle

      t.timestamps null: false
    end
  end
end
