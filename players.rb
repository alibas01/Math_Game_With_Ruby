class Players
  attr_accessor :name, :lives

  def initialize(n)
    @name = n
    @lives = 3
  end
  
  def alive?
    @lives > 0
  end

  def lose
    @lives -= 1
  end
end