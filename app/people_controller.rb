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

params = {
  dollar_format: File.read('spec/fixtures/people_by_dollar.txt'),
  percent_format: File.read('spec/fixtures/people_by_percent.txt'),
  order: :first_name,
}
p PeopleController.new(params).normalize
