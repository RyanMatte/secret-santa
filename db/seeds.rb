# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Create 3 users
User.create([
    { name: "John Doe", email: "john@example.com", password: "password" },
    { name: "Jane Smith", email: "jane@example.com", password: "password" },
    { name: "Mike Johnson", email: "mike@example.com", password: "password" }
])