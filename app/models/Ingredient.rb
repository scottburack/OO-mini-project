class Ingredient

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_common_allergen
    hash = Allergen.all.inject(Hash.new(0)) {|h, v| h[v] += 1; h}
    obj = hash.max_by { |_, v| v }.first
    obj.ingredient
  end

end
