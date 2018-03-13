class River
  attr_reader :name, :fish

  def initialize(input_name, input_fish)
    @name = input_name
    @fish = input_fish
  end

  def fish_count()
    return @fish.count
  end

  def a_fish_is_born(species)
    @fish << Fish.new(species)
  end



end
