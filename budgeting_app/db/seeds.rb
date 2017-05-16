# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Subcategory.destroy_all


# Subcategory.create([
#   {name: "rent", amount: 2200, category: "home", month: "January", month_num: 1, year: 2017, user_id: 1},
#   {name: "rent", amount: 2200, category: "home", month: "February", month_num: 2, year: 2017, user_id: 1},
#   {name: "rent", amount: 2200, category: "home", month: "March", month_num: 3, year: 2017, user_id: 1},
#   {name: "rent", amount: 2200, category: "home", month: "April", month_num: 4, year: 2017, user_id: 1},
#   {name: "rent", amount: 2200, category: "home", month: "May", month_num: 5, year: 2017, user_id: 1},
#   {name: "rent", amount: 2200, category: "home", month: "June", month_num: 6, year: 2017, user_id: 1},
#   {name: "rent", amount: 2200, category: "home", month: "July", month_num: 7, year: 2017, user_id: 1},
#   {name: "rent", amount: 2200, category: "home", month: "August", month_num: 8, year: 2017, user_id: 1},
#   {name: "rent", amount: 2200, category: "home", month: "September", month_num: 9, year: 2017, user_id: 1},
#   {name: "rent", amount: 2200, category: "home", month: "October", month_num: 10, year: 2017, user_id: 1},
#   {name: "rent", amount: 2200, category: "home", month: "November", month_num: 11, year: 2017, user_id: 1},
#   {name: "rent", amount: 2200, category: "home", month: "December", month_num: 12, year: 2017, user_id: 1},

#   {name: "utilities", amount: 200, category: "home", month: "January", month_num: 1, year: 2017, user_id: 1},
#   {name: "utilities", amount: 200, category: "home", month: "February", month_num: 2, year: 2017, user_id: 1},
#   {name: "utilities", amount: 200, category: "home", month: "March", month_num: 3, year: 2017, user_id: 1},
#   {name: "utilities", amount: 200, category: "home", month: "April", month_num: 4, year: 2017, user_id: 1},
#   {name: "utilities", amount: 200, category: "home", month: "May", month_num: 5, year: 2017, user_id: 1},
#   {name: "utilities", amount: 200, category: "home", month: "June", month_num: 6, year: 2017, user_id: 1},
#   {name: "utilities", amount: 200, category: "home", month: "July", month_num: 7, year: 2017, user_id: 1},
#   {name: "utilities", amount: 200, category: "home", month: "August", month_num: 8, year: 2017, user_id: 1},
#   {name: "utilities", amount: 200, category: "home", month: "September", month_num: 9, year: 2017, user_id: 1},
#   {name: "utilities", amount: 200, category: "home", month: "October", month_num: 10, year: 2017, user_id: 1},
#   {name: "utilities", amount: 200, category: "home", month: "November", month_num: 11, year: 2017, user_id: 1},
#   {name: "utilities", amount: 200, category: "home", month: "December", month_num: 12, year: 2017, user_id: 1},

#   {name: "other bills/ supplies", amount: 100, category: "home", month: "January", month_num: 1, year: 2017, user_id: 1},
#   {name: "other bills/ supplies", amount: 100, category: "home", month: "February", month_num: 2, year: 2017, user_id: 1},
#   {name: "other bills/ supplies", amount: 100, category: "home", month: "March", month_num: 3, year: 2017, user_id: 1},
#   {name: "other bills/ supplies", amount: 100, category: "home", month: "April", month_num: 4, year: 2017, user_id: 1},
#   {name: "other bills/ supplies", amount: 100, category: "home", month: "May", month_num: 5, year: 2017, user_id: 1},
#   {name: "other bills/ supplies", amount: 100, category: "home", month: "June", month_num: 6, year: 2017, user_id: 1},
#   {name: "other bills/ supplies", amount: 100, category: "home", month: "July", month_num: 7, year: 2017, user_id: 1},
#   {name: "other bills/ supplies", amount: 100, category: "home", month: "August", month_num: 8, year: 2017, user_id: 1},
#   {name: "other bills/ supplies", amount: 100, category: "home", month: "September", month_num: 9, year: 2017, user_id: 1},
#   {name: "other bills/ supplies", amount: 100, category: "home", month: "October", month_num: 10, year: 2017, user_id: 1},
#   {name: "other bills/ supplies", amount: 100, category: "home", month: "November", month_num: 11, year: 2017, user_id: 1},
#   {name: "other bills/ supplies", amount: 100, category: "home", month: "December", month_num: 12, year: 2017, user_id: 1},

#   {name: "laundry", amount: 25, category: "home", month: "January", month_num: 1, year: 2017, user_id: 1},
#   {name: "laundry", amount: 25, category: "home", month: "February", month_num: 2, year: 2017, user_id: 1},
#   {name: "laundry", amount: 25, category: "home", month: "March", month_num: 3, year: 2017, user_id: 1},
#   {name: "laundry", amount: 25, category: "home", month: "April", month_num: 4, year: 2017, user_id: 1},
#   {name: "laundry", amount: 25, category: "home", month: "May", month_num: 5, year: 2017, user_id: 1},
#   {name: "laundry", amount: 25, category: "home", month: "June", month_num: 6, year: 2017, user_id: 1},
#   {name: "laundry", amount: 25, category: "home", month: "July", month_num: 7, year: 2017, user_id: 1},
#   {name: "laundry", amount: 25, category: "home", month: "August", month_num: 8, year: 2017, user_id: 1},
#   {name: "laundry", amount: 25, category: "home", month: "September", month_num: 9, year: 2017, user_id: 1},
#   {name: "laundry", amount: 25, category: "home", month: "October", month_num: 10, year: 2017, user_id: 1},
#   {name: "laundry", amount: 25, category: "home", month: "November", month_num: 11, year: 2017, user_id: 1},
#   {name: "laundry", amount: 25, category: "home", month: "December", month_num: 12, year: 2017, user_id: 1},

#     {name: "uber", amount: 75, category: "transportation", month: "January", month_num: 1, year: 2017, user_id: 1},
#   {name: "uber", amount: 75, category: "transportation", month: "February", month_num: 2, year: 2017, user_id: 1},
#   {name: "uber", amount: 75, category: "transportation", month: "March", month_num: 3, year: 2017, user_id: 1},
#   {name: "uber", amount: 75, category: "transportation", month: "April", month_num: 4, year: 2017, user_id: 1},
#   {name: "uber", amount: 75, category: "transportation", month: "May", month_num: 5, year: 2017, user_id: 1},
#   {name: "uber", amount: 75, category: "transportation", month: "June", month_num: 6, year: 2017, user_id: 1},
#   {name: "uber", amount: 75, category: "transportation", month: "July", month_num: 7, year: 2017, user_id: 1},
#   {name: "uber", amount: 75, category: "transportation", month: "August", month_num: 8, year: 2017, user_id: 1},
#   {name: "uber", amount: 75, category: "transportation", month: "September", month_num: 9, year: 2017, user_id: 1},
#   {name: "uber", amount: 75, category: "transportation", month: "October", month_num: 10, year: 2017, user_id: 1},
#   {name: "uber", amount: 75, category: "transportation", month: "November", month_num: 11, year: 2017, user_id: 1},
#   {name: "uber", amount: 75, category: "transportation", month: "December", month_num: 12, year: 2017, user_id: 1},

#   {name: "taxi", amount: 75, category: "transportation", month: "January", month_num: 1, year: 2017, user_id: 1},
#   {name: "taxi", amount: 75, category: "transportation", month: "February", month_num: 2, year: 2017, user_id: 1},
#   {name: "taxi", amount: 75, category: "transportation", month: "March", month_num: 3, year: 2017, user_id: 1},
#   {name: "taxi", amount: 75, category: "transportation", month: "April", month_num: 4, year: 2017, user_id: 1},
#   {name: "taxi", amount: 75, category: "transportation", month: "May", month_num: 5, year: 2017, user_id: 1},
#   {name: "taxi", amount: 75, category: "transportation", month: "June", month_num: 6, year: 2017, user_id: 1},
#   {name: "taxi", amount: 75, category: "transportation", month: "July", month_num: 7, year: 2017, user_id: 1},
#   {name: "taxi", amount: 75, category: "transportation", month: "August", month_num: 8, year: 2017, user_id: 1},
#   {name: "taxi", amount: 75, category: "transportation", month: "September", month_num: 9, year: 2017, user_id: 1},
#   {name: "taxi", amount: 75, category: "transportation", month: "October", month_num: 10, year: 2017, user_id: 1},
#   {name: "taxi", amount: 75, category: "transportation", month: "November", month_num: 11, year: 2017, user_id: 1},
#   {name: "taxi", amount: 75, category: "transportation", month: "December", month_num: 12, year: 2017, user_id: 1},

#   {name: "metro", amount: 125, category: "transportation", month: "January", month_num: 1, year: 2017, user_id: 1},
#   {name: "metro", amount: 125, category: "transportation", month: "February", month_num: 2, year: 2017, user_id: 1},
#   {name: "metro", amount: 125, category: "transportation", month: "March", month_num: 3, year: 2017, user_id: 1},
#   {name: "metro", amount: 125, category: "transportation", month: "April", month_num: 4, year: 2017, user_id: 1},
#   {name: "metro", amount: 125, category: "transportation", month: "May", month_num: 5, year: 2017, user_id: 1},
#   {name: "metro", amount: 125, category: "transportation", month: "June", month_num: 6, year: 2017, user_id: 1},
#   {name: "metro", amount: 125, category: "transportation", month: "July", month_num: 7, year: 2017, user_id: 1},
#   {name: "metro", amount: 125, category: "transportation", month: "August", month_num: 8, year: 2017, user_id: 1},
#   {name: "metro", amount: 125, category: "transportation", month: "September", month_num: 9, year: 2017, user_id: 1},
#   {name: "metro", amount: 125, category: "transportation", month: "October", month_num: 10, year: 2017, user_id: 1},
#   {name: "metro", amount: 125, category: "transportation", month: "November", month_num: 11, year: 2017, user_id: 1},
#   {name: "metro", amount: 125, category: "transportation", month: "December", month_num: 12, year: 2017, user_id: 1},

#   {name: "groceries", amount: 75, category: "food", month: "January", month_num: 1, year: 2017, user_id: 1},
#   {name: "groceries", amount: 75, category: "food", month: "February", month_num: 2, year: 2017, user_id: 1},
#   {name: "groceries", amount: 75, category: "food", month: "March", month_num: 3, year: 2017, user_id: 1},
#   {name: "groceries", amount: 75, category: "food", month: "April", month_num: 4, year: 2017, user_id: 1},
#   {name: "groceries", amount: 75, category: "food", month: "May", month_num: 5, year: 2017, user_id: 1},
#   {name: "groceries", amount: 75, category: "food", month: "June", month_num: 6, year: 2017, user_id: 1},
#   {name: "groceries", amount: 75, category: "food", month: "July", month_num: 7, year: 2017, user_id: 1},
#   {name: "groceries", amount: 75, category: "food", month: "August", month_num: 8, year: 2017, user_id: 1},
#   {name: "groceries", amount: 75, category: "food", month: "September", month_num: 9, year: 2017, user_id: 1},
#   {name: "groceries", amount: 75, category: "food", month: "October", month_num: 10, year: 2017, user_id: 1},
#   {name: "groceries", amount: 75, category: "food", month: "November", month_num: 11, year: 2017, user_id: 1},
#   {name: "groceries", amount: 75, category: "food", month: "December", month_num: 12, year: 2017, user_id: 1},
#   ])

































