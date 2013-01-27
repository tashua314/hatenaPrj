# coding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
Scrap.create(
  :id => 1, 
  :entry_title => 'test title', 
  :entry_summary => 'test summary', 
  :url => 'http://google.co.jp', 
  :update_date => Time.now.strftime("%Y-%m-%d %H:%M:%S"), 
  :create_date => Time.now.strftime("%Y-%m-%d %H:%M:%S")
)

