class CreateUrls < ActiveRecord::Migration[6.1]
  def change
    create_table :urls do |t|
      t.string :url
      t.string :short_url
      t.integer :clicked, default: 0
      t.text :country
      t.string :ip_address
      t.datetime :expire_at
      t.timestamps
    end
  end
end

