# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Role.new(name: 'admin').save
Role.new(name: 'user').save
Role.new(name: 'guest').save

admin = User.new(email: 'admin@mail.cz', password: 'smaliphz22')
admin.add_role('admin')
admin.skip_confirmation!
admin.confirmed_at = DateTime.now
admin.save

