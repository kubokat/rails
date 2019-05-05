# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

badges = [
    { name: 'shield', image: 'https://image.flaticon.com/icons/png/128/1579/1579490.png', rule_name: 'level', rule_value: '1' },
    { name: 'star', image: 'https://image.flaticon.com/icons/png/128/1579/1579491.png', rule_name: 'category', rule_value: 'backend' },
    { name: 'bear', image: 'https://image.flaticon.com/icons/png/128/1579/1579492.png', rule_name: 'attempt' },
]

Badge.create(badges)
