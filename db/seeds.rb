# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Store initial data

Category.create(name: 'Coolers', description: 'Default category', active: true)

Brand.create(name: 'Bsk', description: 'Cooler Category')

Page.create(title: 'About', text: 'Default page', seo_url: 'about')

User.create(email: 'bskkurali@gmail.com',
            first_name: 'Varun',
            last_name: 'Singh',
            password: 'varun12345',
            password_confirmation: 'varun12345',
            admin: true)
