require('minitest/autorun')
require_relative('../fish')

class FishTest < MiniTest::Test

 def test_fish_has_species
   fish = Fish.new("Trout")
   assert_equal("Trout", fish.species)
 end

end
