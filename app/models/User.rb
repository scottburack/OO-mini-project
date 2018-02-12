class User

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def recipe_cards
    RecipeCard.all.select {|rc| rc.user == self}
  end


  def recipes
    self.recipe_cards.map {|rc| rc.recipe}
  end

  def add_recipe_card(recipe, rating)
    new_rc = RecipeCard.new(self, recipe)
    new_rc.rating = rating
    new_rc
  end

  def declare_allergen(ingredient)
    Allergen.new(ingredient, self)
  end

  def allergens
    Allergen.all.select {|all| all.user == self}.map {|all| all.ingredient}
  end

  def top_three_recipes
    self.recipe_cards.sort! {|x,y| y.rating <=> x.rating}[0...3]
  end

  def most_recent_recipe
    self.recipe_cards.sort! {|x,y| y.date <=> x.date}[0]
  end
  # 
  # def safe_recipes
  #   algs = self.allergens
  #
  # end



end
