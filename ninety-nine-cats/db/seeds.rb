# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ActiveRecord::Base.transaction do
    Cat.delete_all

    george = Cat.create!(name: "George", color: "white", sex: "F", birth_date: "2020/12/3")
    joey = Cat.create!(name: "Joey", color: "black", sex: "M", birth_date: "1998/10/10")
    kevin = Cat.create!(name: "Kevin", color: "blue", sex: "M", birth_date: "1997/02/25")
    wilson = Cat.create!(name: "Wilson", color: "blue", sex: "F", birth_date: "1997/12/3")
    manny = Cat.create!(name: "Manny", color: "white", sex: "M", birth_date: "2019/12/3")

end