require 'spec_helper'
require_relative '../../app/models/user.rb'

RSpec.describe 'App Model Test' do
  describe 'User model' do
    let(:params) {{first_name: 'Elliot', last_name: 'Rhiannon', city: 'New York City', birthdate: '30-4-1974'}}

    it 'User object should be created' do
      user = User.new(params[:first_name], params[:last_name], params[:birthdate], params[:city])

      expect(user.class).to eq User
    end
  end
end
