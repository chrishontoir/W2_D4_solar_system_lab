class StarSystem
  attr_reader :name, :planets

  def initialize(name, planet_array)
    @name = name
    @planets = planet_array
  end

  def planet_names
    names = []
    @planets.each {|planet| names << planet.name}
    return names
  end

  def get_planet_by_name(name)
    @planets.find {|planet| planet.name == name}
  end

  def get_largest_planet
    @planets.max_by {|planet| planet.diameter}
  end

  def get_smallest_planet
    @planets.min_by {|planet| planet.diameter}
  end

  def get_planets_with_no_moons
    @planets.find_all {|planet| planet.number_of_moons == 0}
  end


  def get_planets_with_more_moons(number)
  more_moons = []
  @planets.each {|planet|
    if planet.number_of_moons > number
      more_moons << planet.name
    end
  }
  return more_moons
  end

  def get_number_of_planets_closer_than(distance)
  planets_closer = []
    @planets.each {|planet|
        if planet.distance_from_sun < 1000
          planets_closer << planet
        end}
        return planets_closer.length
  end
  
# def get_number_of_planets_closer_than(distance)
#   @planets.count { |planet| planet.distance_from_sun < distance }
# end

  def get_total_number_of_moons
  total_moons = []
  @planets.each {|planet| total_moons << planet.number_of_moons}
  total_moons.reduce {|sum, moon| sum + moon}
  end
  
# def get_total_number_of_moons
#   @planets.reduce(0) { |total, planet| total + planet.number_of_moons }
# end
  
  def get_planet_names_sorted_by_increasing_distance_from_sun
    sorted_array = @planets.sort_by {|planet| planet.distance_from_sun}
    sorted_array.map {|planet| planet.name}
  end

  def get_planet_names_sorted_by_size_decreasing
    sorted_array = @planets.sort_by {|planet| planet.diameter}
    sorted_names = sorted_array.map {|planet| planet.name}
    sorted_names.reverse
  end 

end
