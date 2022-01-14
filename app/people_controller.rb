require_relative './helpers/format_helper.rb'
require_relative './views/users_view.rb'

class PeopleController
  include FormatHelper

  def initialize(params)
    @params = params
  end

  def normalize
    users_data = get_users_data(params)
    user_view = UsersView.new(users_data, params[:order])
    user_view.general_view
  end

  private

  attr_reader :params
end
