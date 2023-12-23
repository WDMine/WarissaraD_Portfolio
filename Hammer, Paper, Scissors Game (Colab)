game = function () {
# Initialize variables
    player_name <- ""
    player_score <- 0
    computer_score <- 0

# Greet the player
    print("Welcome to the Hammer, Paper, Scissors game!")
                flush.console()

# Get the player's name
    player_name <- readline("Please enter your name: ")
                flush.console()

# Start the game loop
    while (TRUE) {

        # Get player's choice
            player_choice <- readline("Please choose hammer, paper, or scissors: ")
                flush.console()

        # Validate choice
            if (!(player_choice %in% c("hammer", "paper", "scissors"))) {
                print("Invalid choice. Please choose hammer, paper, or scissors.")
                    flush.console()
            next
            }

        # Computer choice
            computer_choice <- sample(c("hammer", "paper", "scissors"), 1)
                print(paste("Computer chose:", computer_choice))
                     flush.console()

  # Determine winner
    if (player_choice == computer_choice) {
            print("Draw!")
                flush.console()
    } else if (player_choice == "hammer" && computer_choice == "scissors") {
        player_score <- player_score + 1
            print("You win!")
                flush.console()
    }else if (player_choice == "paper" && computer_choice == "rock") {
        player_score <- player_score + 1
            print("You win!")
                flush.console()
    } else if (player_choice == "scissors" && computer_choice == "paper") {
        player_score <- player_score + 1
            print("You win!")
                flush.console()
    } else {
        computer_score <- computer_score + 1
            print("Computer wins!")
                flush.console()
    }

  # Display scores
    print(paste("Your score:", player_score))
                flush.console()

    print(paste("Computer score:", computer_score))
                flush.console()

# Ask to play again
    # Play again loop
        while(TRUE) {

            play_again <- readline("Play again? (y/n)")
            play_again <- tolower(play_again)

                 if(play_again == "y") {
                        flush.console()
                break

                }   else if(play_again == "n") {
                        flush.console()
                    return("Thank you for playing!")

                    }   else {
                        print("Invalid input, please enter y or n")
                            flush.console()
                    next
                        }
            }
    }
}
