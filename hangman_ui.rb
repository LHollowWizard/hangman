require 'colorize'

def welcome_player
    puts "Welcome to the hangman game"
    puts "What is your name?"
    name = gets.strip
    puts "\n"
    puts "Your game is starting, #{name}"
    name
end

def choose_secret_word_AI
    puts "\n"
    puts "Choose the difficulty:"
    puts "1 - Easy"
    puts "2 - Medium"
    puts "3 - Hard"
    while true
        difficulty = gets.strip.to_i
         case difficulty
         when 1
            words_file = File.open("easy_words.txt")
            file_data = words_file.readlines
            secret_word = file_data[rand(file_data.size)].downcase
            words_file.close
            break
         when 2
            words_file = File.open("medium_words.txt")
            file_data = words_file.readlines
            secret_word = file_data[rand(file_data.size)].downcase
            words_file.close
            break
         when 3
            words_file = File.open("hard_words.txt")
            file_data = words_file.readlines
            secret_word = file_data[rand(file_data.size)].downcase
            words_file.close
            break
         else
            puts "Choose a valid difficulty"
         end
    end
    puts "Choosing a secret word"
    puts "#{rand(10)}%".red
    sleep(0.2)
    puts "#{rand(11..20)}".red
    sleep(0.2)
    puts "#{rand(21..30)}%".red
    sleep(0.1)
    puts "#{rand(31..50)}%".red
    sleep(0.1)
    puts "#{rand(60..70)}%".red
    sleep(0.2)
    puts "#{rand(77..85)}%".red
    sleep(0.2)
    puts "#{rand(86..99)}%".red
    sleep(0.5)
    puts "100%".red
    sleep(0.1)
    puts "Done, a word with #{secret_word.size} letters has been chosen... good luck".green
    secret_word.strip   
end

def play_again?
	ways_of_saying_no = ["n", "no", "nope", "not", "dont", "never", "noo"]
	ways_of_saying_yes = ["y", "ye", "yes", "yep", "indeed", "please", "do", "yess"]
	puts "Do you wish to play again?"
    while true
        
        continue = gets.strip.downcase
        
        if ways_of_saying_yes.include? continue
            return true
        end

        if ways_of_saying_no.include? continue
            return false
        end

		puts "Answer Yes or No".red
	end
end

def ask_a_guess(guesses, mistakes, correct_letters, known_word)
    puts "\n"
    letters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    
    if guesses.size > 0
        puts "Mistakes until now: #{mistakes}"
        puts "Guesses until now: #{guesses}"
        puts "Correct letters until now: #{correct_letters}"
        puts "This is the current known word: #{known_word}".green
        puts "\n"
    end
    
    puts "Enter a letter or a word:"
    while true
        guess = gets.strip
        exit_loop = true

        if guesses.include? guess
            puts "Try a new word or letter".red
            exit_loop = false
        end

        if guess.size == 1
            if !letters.include? guess.downcase
                puts "You must try a letter\n\n".red
                exit_loop = false
            end
        end
        if exit_loop
            break
        end

    end
    guess
end

def verify_letter(guess, secret_word)
    if secret_word.include? guess
        puts "\n\nThe letter #{guess.upcase} is correct!\n\n".green
        return secret_word.count(guess)
    end

    puts "\n\nThe letter #{guess.upcase} is incorrect...\n\n".red
    0
end

def verify_word (guess, secret_word)
    if guess == secret_word
        return true
    end

    puts "\n\nThat is not the correct word...\n\n".red
    false
end

def won_the_game(known_word)
    puts "Congratulations, you won the game!".green
    puts "This is the current known word: #{known_word}".green
end

def end_game(secret_word)
    puts "The secret word was: #{secret_word}"
end
