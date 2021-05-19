# Play hangman!
require 'yaml'
class Game
  attr_accessor :secret_word, :wrong_guess_count, :hangman_display, :secret_display, :wrong_guess_bank, :game_lost, :game_won

  HANGMAN_ARR = [
    "    ------\n    |    |\n         |\n         |\n         |\n         |\n============",
    "    ------\n    |    |\n    O    |\n         |\n         |\n         |\n============",
    "    ------\n    |    |\n    O    |\n   /     |\n         |\n         |\n============",
    "    ------\n    |    |\n    O    |\n   /|    |\n         |\n         |\n============",
    "    ------\n    |    |\n    O    |\n   /|\\   |\n         |\n         |\n============",
    "    ------\n    |    |\n    O    |\n   /|\\   |\n  \"      |\n         |\n============",
    "    ------\n    |    |\n    O    |\n   /|\\   |\n  \"   \"  |\n         |\n============",
    "    ------\n    |    |\n    O    |\n   /|\\   |\n  \"/  \"  |\n         |\n============",
    "    ------\n    |    |\n    O    |\n   /|\\   |\n  \"/ \\\"  |\n         |\n============",
    "    ------\n    |    |\n    O    |\n   /|\\   |\n  \"/ \\\"  |\n  <      |\n============",
    "    ------\n    |    |\n    O    |\n   /|\\   |\n  \"/ \\\"  |\n  <   >  |\n============"
  ].freeze
  def initialize
    @secret_word = word_picker
    @wrong_guess_count = 0
    @secret_display = Array.new(@secret_word.size, '-')
    @wrong_guess_bank = []
    @game_won = false
    @game_lost = false
    like_to_load?
  end

  def like_to_load?
    choice = ''
    until choice == 'y' || choice == 'n'
      puts "Would you like to load a previous save? y/n"
      choice = gets.chomp.to_s.downcase
    end
    if choice == 'y'
      load_game
    # else
    #   return
    end
  end

  def word_picker
    File.readlines('dictionary.txt').sample.split('')[0..-3].join('').downcase
  end

  def display_board
    puts HANGMAN_ARR[@wrong_guess_count]
  end

  def secret_displayer
    puts @secret_display.join('')
  end

  def wrong_guess_bank_displayer
    puts "Already guessed: [#{@wrong_guess_bank.join(' ')}]"
  end

  def wrong_guess_incrementer
    @wrong_guess_count += 1 unless @wrong_guess_count >= 10
  end

  def guess
    guess = ''
    puts "Make a guess!"
    guess = gets.chomp.to_s.downcase
    if guess == 'save'
      save_game
    else
      while guess.size != 1 || @wrong_guess_bank.include?(guess) || @secret_display.include?(guess)
      puts 'Guess a single unused letter'
      guess = gets.chomp.to_s.downcase
      end
    end
    guess
  end

  def like_to_save?
    puts "Enter 'y' to save the game"
    choice = gets.chomp.to_s.downcase
    if choice == 'y'
      save_game
    end
  end

  def guess_checker(guess)
    if @secret_word.include?(guess)
      @secret_word.split('').each_with_index do |char, index|
        if char == guess
          @secret_display[index] = guess
        end
      end
    elsif guess == 'save'
      return
    else
      wrong_guess_incrementer
      @wrong_guess_bank << guess
    end
  end

  def check_win
    unless @secret_display.include?('-')
      @game_won = true
    end
  end

  def check_loss
    if @wrong_guess_count > 9
      @game_lost = true
    end
  end

  def round
    puts `clear`
    puts "Enter 'save' as your choice at any time to save the game"
    display_board
    # puts @secret_word # remove eventually
    secret_displayer
    wrong_guess_bank_displayer
    guess_checker(guess)
    check_win
    check_loss
  end

  def play
    until @game_won || @game_lost
      round
    end
    puts `clear`
    display_board
    secret_displayer
    if @game_won
      puts 'You won!'
      like_to_save?
    else
      puts "Try again next time. The secret word was #{secret_word}"
    end
  end

  def save_game
    Dir.mkdir('saved_games') unless Dir.exist?('saved_games')
    game = YAML::dump(self)
    filename = "saved_games/'#{@secret_display.join('')}' from #{Time.new.strftime('%k:%M %d-%m-%Y')}.yaml"
    puts filename
    File.open(filename, 'w') do |file|
      file.puts game
    end
    puts "Your game has been saved"
    sleep(3)
  end

  def load_game
    previous_games = Dir.entries('saved_games')[2..-1]
    previous_games.each_with_index {|game, index| puts "#{index}. #{game}"}
    puts "Enter the number of the game you would like to resume"
    choice = gets.chomp.to_i
    game_data = File.open("saved_games/#{previous_games[choice]}", 'r')
    game = YAML::load(game_data)
    game.play
  end
end


hangman = Game.new

hangman.play

