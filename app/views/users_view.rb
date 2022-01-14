require_relative '../models/user.rb'

class UsersView
  def initialize(users, order_by)
    @users = User.sort_by(users, order_by)
  end

  def general_view
    users.map! do |user|
      [user.first_name, user.city, user.birthdate].join(', ')
    end
  end

  private

  attr_reader :users
end
