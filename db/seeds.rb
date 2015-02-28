# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin_user = Admin.new({
	:email => 'samuelralak@hotmail.com',
	:password => 'blogadmin', 
	:password_confirmation => 'blogadmin',
	:confirmed_at => Time.now})
admin_user.save!
admin_user.add_role :admin