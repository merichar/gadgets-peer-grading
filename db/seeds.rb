# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
c = User.create(:andrewid => "akuznets", :username => "akuznets")
d = User.create(:andrewid => "meribyte", :username => "meribyte")
e = User.create(:andrewid => "hudson", :username => "hudson")

a = User.create(:andrewid => "janej", :username => "janej")
b = User.create(:andrewid => "mwilliams", :username => "mwilliams")

ReviewGroup.delete_all
rg_scott = ReviewGroup.create(:name => "Team Scott", :owner => User.find(e))
rg_meg = ReviewGroup.create(:name => "Team Meg", :owner => User.find(d))
rg_stacey = ReviewGroup.create(:name => "Team Stacey", :owner => User.find(c))

a.review_group = rg_meg
b.review_group = rg_stacey

a.save!
b.save!
