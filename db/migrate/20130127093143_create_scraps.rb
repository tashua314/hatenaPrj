class CreateScraps < ActiveRecord::Migration
  def change
    create_table :scraps do |t|
      t.integer :id
      t.string :entry_title
      t.string :url
      t.string :entry_summary
      t.timestamp :update_date
      t.timestamp :create_date

      t.timestamps
    end
  end
end
