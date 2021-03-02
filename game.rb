require "./players"
require "./questions"

class Game
  def initialize()
    @player1 = Players.new("Player 1")
    @player2 = Players.new("Player 2")
    @current_player = @player1
    @question = Questions.new
  end

  def start
    turn = @player1
    while turn.alive?
      num = @question.construct()
      puts "#{@current_player.name}: What does #{num[0]} plus #{num[1]} equal?"
      print "> "
      answer = gets.chomp.to_i

      if @question.correct?(answer)
        puts "YES! You are correct."
      else
        puts "Seriously? No!"
        @current_player.lose
      end

      if turn == @player1 
        @current_player = @player2
        turn = @player2
      else 
        @current_player = @player1
        turn = @player1
      end
      score()

      puts "----- NEW TURN -----"
      
      if  @player1.lives == 0 || @player2.lives == 0
        end_of_game()
        puts "----- GAME OVER -----"
        puts "Good bye!"
        break
      end
    end
  end

  def score
    puts "P1: #{@player1.lives}/3 vs. P2: #{@player2.lives}/3"
  end
  
  def final_result(player)
    puts "#{player.name} wins with a score of #{player.lives}/3"
  end

  def end_of_game
    @player1.alive? ? final_result(@player1) : final_result(@player2)
  end
end