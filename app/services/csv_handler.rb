require 'csv'
require_relative '../models/user.rb'

class CsvHandler
  attr_reader :users

  def initialize
    @users = []
  end

  def read_in_csv_data(file_data_in_string)
    CSV.parse(file_data_in_string, headers: true) do |row|
      row = row.map {|k,v|[k.strip, v.strip]}.to_h
      @users << User.new(row['first_name'], row['last_name'], row['birthdate'], row['city'])
    end
  end
end
