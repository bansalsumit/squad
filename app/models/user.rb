class User
  def initialize(first_name, last_name, birthdate, city)
    @first_name = first_name
    @last_name = last_name
    @birthdate = birthdate
    @city = city
  end

  private

  attr_reader :first_name, :last_name, :birthdate, :city
end
