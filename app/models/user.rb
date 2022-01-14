class User
  attr_reader :first_name, :last_name, :birthdate, :city

  def initialize(first_name, last_name, birthdate, city)
    @first_name = first_name
    @last_name = last_name
    @birthdate = birthdate
    @city = city
  end

  private

  attr_reader :last_name

  def self.sort_by(users, attr)
    users.sort_by! do |user|
      user.send(attr)
    end
  end
end
