class Bear
  attr_reader :name, :stomach

  def initialize(input_name)
    @name = input_name
    @stomach = []
  end

  def eat_a_fish(fish)
    @stomach << fish
  end

  def is_starving?
    @stomach.empty?
  end

  def hunt_for_fish(river)
    unless river.fish.empty?
      @stomach.push(river.fish.shift)
    end
  end

  def digest()
    @stomach.clear
  end

  def hunt_for_many_fish(river, fish_count)
    fish_count.times do
      hunt_for_fish(river)
    end
  end
end
