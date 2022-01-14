require 'spec_helper'
require_relative '../../app/services/csv_handler.rb'

RSpec.describe 'App CSV Hander Test' do
  describe 'Handling the file data and converting it to user' do
    let(:params) do
      "city , birthdate , last_name , first_name\nLA , 30-4-1974 , Nolan , Rhiannon\nNYC , 5-1-1962 , Bruen , Rigoberto\n"
    end

    it 'Users object should be created' do
      csv = CsvHandler.new
      csv.read_in_csv_data(params)

      expect(csv.users.count).to eq 2
    end
  end
end
