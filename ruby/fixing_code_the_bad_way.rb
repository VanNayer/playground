require 'test/unit'
require 'pry'
extend Test::Unit::Assertions

class Person
  def initialize(name, age, incoming_race)
    @name = name
    @age = age
    self.race = incoming_race
  end

  def nam
    @name.split.map(&:capitalize).join(' ')
  end

  def agE
    @age
  end

  def method_missing(m, *args)
    if m == :name
      nam
    elsif m == :race
      @race.capitalize
    elsif m == :race=
      @race = args[0]
    elsif m == :age
      agE
    else
      super
    end
  end
end

person = Person.new('kurt vonnegut', 89, 'caucasian')

assert_equal person.name, 'Kurt Vonnegut'
assert_equal person.race, 'Caucasian'
assert_equal person.age, 89
