# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "SEED > CLEAN DB"
[Game, User, Case].each(&:delete_all)
#--------------------------------------------------------------------
puts "SEED > ADD USERS"
computer = User.new(
  nickname: "Computer",
  email: "computer@mail.com",
  password: "computer")
computer.save
papy = User.new(
  nickname: "Papy",
  email: "florent@mail.com",
  password: "florent")
papy.save
#--------------------------------------------------------------------
puts "SEED > ADD GAMES"
10.times do
  Game.create(user: [computer, papy].sample)
end
#--------------------------------------------------------------------
puts "SEED > ADD CASES"
3.times do |row|
  3.times do |col|
    Case.create(col: col, row: row, value: [-1, 0, 1].sample)
  end
end


