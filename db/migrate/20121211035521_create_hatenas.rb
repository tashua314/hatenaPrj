class CreateHatenas < ActiveRecord::Migration
  def change
    create_table :hatenas do |t|
      t.string :url
      t.datetime :time

      t.timestamps
    end
  end
end
