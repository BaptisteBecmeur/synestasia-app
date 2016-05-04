# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


if User.with_role(:admin).empty?
	admin = User.create!(email: "admin@synestasia.com", password: "aisatsenys", first_name:"admin", last_name: "admin")
	admin.add_role :admin
end


# rake db:seed fake_users=yes
if ENV["fake_users"]
	10.times do |i|
		id = i.to_s
		user = User.create!(email: "fake_"+id+"@synestasia.com", password: "12345678", first_name:"user"+id, last_name: "test")
		teacher = User.create!(email: "fake_teacher_"+id+"@synestasia.com", password: "12345678", first_name:"teacher"+id, last_name: "test")
		teacher.add_role :teacher
	end
end
