require_relative './helpers/format_helper.rb'

class PeopleController
  include FormatHelper

  def initialize(params)
    @params = params
  end

  def normalize
  end

  private

  attr_reader :params
end
