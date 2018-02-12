class Recipe

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_popular
    count_hash = Hash.new(0)

    RecipeCard.all.each do |rc|
      if count_hash[rc.recipe.name] = 0
        count_hash[rc.recipe.name] = 1
      else
        count_hash[rc.recipe.name] += 1
      end
    end

    Recipe.find_by_name(count_hash.max_by { |k, v| v}[0])
  end

  def self.find_by_name(name)
    @@all.each do |rec|
      return rec if rec.name == name
    end
  end

  def add_ingredients(ingredient_array)
    ingredient_array.each do |ing|
      RecipeIngredient.new(self, ing)
    end
  end

  def users
    RecipeCard.all.select do |rc|
      rc.recipe == self
    end.map {|rc| rc.user}
  end

  def ingredients
    RecipeIngredient.all.select do |ri|
      ri.recipe == self
    end.map {|ri| ri.ingredient}
  end

  def allergens
    self.ingredients.select do |ing|
      Allergens.all.includes(ing)
    end
  end




end
