require_relative '../models/user.rb'
require 'date'

class UsersView
  CITY = {'NYC': 'New York City', 'LA': 'Los Angeles'}

  def initialize(users, order_by)
    @users = User.sort_by(users, order_by)
  end

  def general_view
    users.map! do |user|
      city = CITY[user.city.to_sym] || user.city
      [user.first_name, city, user.birthdate.strftime('%-m/%-d/%-Y')].join(', ')
    end
  end

  private

  attr_reader :users
end
