require_relative 'hangman_ui'

def starred_array(secret_word_size)
    starred_array = []
    for i in 1..secret_word_size
        starred_array << "*"
    end

    starred_array
end

def play
    secret_word = choose_secret_word_AI
    known_word = starred_array(secret_word.size)

    amount_of_letters_to_win = secret_word.size
    total_amount_of_correct_letters = 0
    mistakes = 0
    guesses = []
    correct_letters = []

    while mistakes <= 10
        guess = ask_a_guess(guesses, mistakes, correct_letters, known_word)
        guesses << guess

        if guess.size > 1

            if verify_word(guess, secret_word)
                won_the_game(known_word)
                break
            end

            mistakes += 1

        else
            amount_of_correct_letters = verify_letter(guess, secret_word)

            if amount_of_correct_letters >= 1
                correct_letters << guess
                total_amount_of_correct_letters += amount_of_correct_letters

                index_to_offset = 0

                for i in 1..amount_of_correct_letters
                    known_word[secret_word.index(guess, index_to_offset)] = guess.upcase
                    index_to_offset = secret_word.index(guess, index_to_offset) + 1
                end

            else
                mistakes += 1
            end

        end

        if total_amount_of_correct_letters == amount_of_letters_to_win
            won_the_game(known_word)
            break
        end
    end
    end_game(secret_word)
end