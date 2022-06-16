# frozen_string_literal: true

class Reader
  include Validation

  attr_reader :name, :email, :city, :street, :house

  def initialize(name, email, city, street, house)
    @name = name
    @email = email
    @city = city
    @street = street
    @house = house
  rescue StandardError
    exit
  end

  def validate(name, email, city, street, house)
    val_for_type(name, String)
    val_for_type(email, String)
    val_for_type(city, String)
    val_for_type(street, String)
    val_for_type(house, Integer)
  end
end
