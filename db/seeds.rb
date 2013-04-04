# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.find_or_create_by_email("admin@testblog.st")
user.password='password'
user.password_confirmation='password'
user.role='admin'
user.save

user1 = User.find_or_create_by_email("client@testblog.st")
user1.password='password'
user1.password_confirmation='password'
user1.role='client'
user1.save