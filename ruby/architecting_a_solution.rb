# frozen_string_literal: true
require 'test/unit'
extend Test::Unit::Assertions

Architect = Struct.new(:name, :works)
flr = Architect.new('frank loyd wright')
imp = Architect.new('I. M. Pei', ['new college dorms', 'jfk library'])

flr.works = %w('Guggenheim fallingwater')

assert_equal flr.name, 'frank loyd wright'
assert_equal imp.works, ['new college dorms', 'jfk library']
