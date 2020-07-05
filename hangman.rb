require_relative 'hangman_logic'

######
name = welcome_player
######

loop do
    play
    if !play_again?
        break
    end
end