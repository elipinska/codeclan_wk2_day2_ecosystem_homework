require('minitest/autorun')
require_relative('../river')
require_relative('../fish')

class RiverTest < MiniTest::Test

 def setup
   @river = River.new("Amazon", [Fish.new("Trout"), Fish.new("Salmon"), Fish.new("Herring"), Fish.new("Trout"), Fish.new("Trout"), Fish.new("Carp"), Fish.new("Herring")])
 end

 def test_river_has_name
   assert_equal("Amazon", @river.name)
 end

 def test_fish_count_with_7_fish
   assert_equal(7, @river.fish_count())
 end

 def test_a_fish_is_born
   @river.a_fish_is_born("Carp")
   assert_equal("Carp", @river.fish[-1].species)
 end


end
