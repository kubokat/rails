# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: "User 1")
Category.create([{title: "first category"}, {title: "last category"}])
Test.create([{title: "Test1", level: 1, category_id: 1}, {title: "Test2", level: 1, category_id: 1}, {title: "Test3", level: 2, category_id: 2}])

Test.all.each do |test|
  test.users << User.first
end

questions = []

(0..15).each do |number|
  questions[number] = {body: "question number #{number+1}", test_id: 1}
end

Question.create(questions)

Answer.create(correct: false, question_id: 1)
