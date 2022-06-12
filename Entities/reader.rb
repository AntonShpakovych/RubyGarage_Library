# frozen_string_literal: true

require_relative '../Validation/validation'

# Reader => Name, Email, City, Street - required, String, not empty | House - equired, Integer, positive
class Reader
  include Validaiton
  attr_accessor :name, :email, :city, :street, :house

  def initialize(name, email, city, street, house)
    @name = val_for_type(name, String) ? name : raise('name - String, not empty')
    @email = val_for_type(email, String) ? email : raise('email - String, not empty')
    @city = val_for_type(city, String) ? city : raise('city - String, not empty')
    @street = val_for_type(street, String) ? street : raise('street - String, not empty')
    @house = val_for_type(house, Integer) ? house : raise('house - Integer, positive')
  rescue StandardError => e
    puts e.message
    exit
  end

  def to_s
    "Name: #{@name}| Email: #{@email} | City: #{@street} | House: #{@house}"
  end
end
