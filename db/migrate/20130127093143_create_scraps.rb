class CreateScraps < ActiveRecord::Migration
  def change
    create_table :scraps do |t|
      t.primary_key:id
      t.string :entry_title
      t.string :url
      t.string :entry_summary

      t.timestamps
    end
  end
end
