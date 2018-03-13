require('minitest/autorun')
require_relative('../bear')
require_relative('../fish')
require_relative('../river')


class BearTest < MiniTest::Test

 def setup
   @bear = Bear.new("Yogi")
   @fish1 = Fish.new("Trout")
   @river = River.new("Amazon", [Fish.new("Salmon"), Fish.new("Trout"), Fish.new("Salmon"), Fish.new("Herring"), Fish.new("Trout"), Fish.new("Trout"), Fish.new("Carp"), Fish.new("Herring")])
 end

 def test_bear_has_name
   assert_equal("Yogi", @bear.name)
 end

 def test_bear_has_empty_stomach
   assert_equal(0, @bear.stomach.count)
 end

 def test_each_a_fish__has_one_trout_in_stomach
   @bear.eat_a_fish(@fish1)
   assert_equal(1, @bear.stomach.count)
   assert_equal("Trout", @bear.stomach[0].species)
 end

 def test_bear_is_starving__true
   assert_equal(true, @bear.is_starving?)
 end

 def test_bear_is_starving__false
   @bear.eat_a_fish(@fish1)
   assert_equal(false, @bear.is_starving?)
 end

def test_hunt_for_fish__bear_eats_3_fish_5_fish_left_in_river
  @bear.hunt_for_fish(@river)
  assert_equal(1, @bear.stomach.count)
  assert_equal("Salmon", @bear.stomach[0].species)
  @bear.hunt_for_fish(@river)
  @bear.hunt_for_fish(@river)
  assert_equal(3, @bear.stomach.count)
  assert_equal("Trout", @bear.stomach[1].species)
  assert_equal("Salmon", @bear.stomach[2].species)
  assert_equal(5, @river.fish_count())
end

def test_hunt_for_more_fish_than_in_river
  10.times do
    @bear.hunt_for_fish(@river)
  end
  assert_equal(8, @bear.stomach.count)
  assert_equal(0, @river.fish_count())
end

def test_bear_eats_3_fish_and_digests
 @bear.hunt_for_fish(@river)
 @bear.hunt_for_fish(@river)
 @bear.hunt_for_fish(@river)
 @bear.digest()
 assert_equal(0, @bear.stomach.count)
end

def test_hunt_for_many_fish_bear_eats_5
  @bear.hunt_for_many_fish(@river, 5)
  assert_equal(3, @river.fish_count())
  assert_equal(5, @bear.stomach.count)
 end

 def test_hunt_for_many_fish_more_fish_than_in_river
   @bear.hunt_for_many_fish(@river, 15)
   assert_equal(0, @river.fish_count())
   assert_equal(8, @bear.stomach.count)
  end
end
