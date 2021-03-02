class Questions
  def initialize()
    @num1 = 0
    @num2 = 0
    @answer = 0
  end

  def correct?(result)
    result == @answer
  end

  def construct
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @answer = @num1 + @num2
    return [@num1, @num2]
  end
end
