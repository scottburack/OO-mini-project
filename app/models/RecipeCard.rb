class RecipeCard

  attr_accessor :user, :recipe, :rating
  attr_reader :date

  @@all = []

  def initialize(user, recipe)
    @date = Time.now
    @rating = nil
    @user = user
    @recipe = recipe
    @@all << self
  end

  def self.all
    @@all
  end




end
