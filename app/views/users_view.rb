require_relative '../models/user.rb'
require 'date'

class UsersView
  def initialize(users, order_by)
    @users = User.sort_by(users, order_by)
  end

  def general_view
    users.map! do |user|
      [user.first_name, user.city, user.birthdate.strftime('%-m/%-d/%-Y')].join(', ')
    end
  end

  private

  attr_reader :users
end
