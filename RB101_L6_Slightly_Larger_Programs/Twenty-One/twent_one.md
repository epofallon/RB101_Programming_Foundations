- Explicit Rules / Requirements
  - normal 52 card deck with the 4 suits (hearts, diamons, clubs and spades),
    and 13 values (2, 3, 4, 5, 6, 7, 8, 9, 10, jack, queen, king, ace)
  - the goal is to get as close to 21 as possible without going over.
    - if you og over 21, you 'bust' and lose the game
  - The game has two players, a dealer(computer) and a player(person)
  - both players are initially dealt two cards
  - The player can see their two cards, but only one of the dealer's cards
  - Card Values
    - 2 - 10 are worth their face value
    - Jack, Queen and King are worth 10
    - Ace is worth either 11 or 1
      - The Ace's value is determined at each time a new card is drawn form the deck
      - Program must consider and calculate each ace in a player's hand SEE NOTES
  - The player takes the first turn
    - The player can choose to 'hit' or 'stay'
      - 'hit' means the player takes another card
      - 'stay' means the player just keeps what he has
    - The player's turn is over when he either busts or stays
      - If the player busts the game is over and the dealer won
  - If the player stays it is the dealer's turn
    - The dealer will hit until his toatl is at least 17
    - If the dealer busts the player wins
  - If both the player and dealer have stayed it is time to compare total card values
    - Who ever has the highest wins

## VERY HIGH-LEVEL PSEUDO-CODE ##
1. Initialize deck
2. Deal cards to player and dealer
3. Player turn: hit or stay
  - repeat until bust or 'stay'
4. If player bust, dealer wins
5. Dealer turn: hit or stay
  - repeat until total >= 17
6. If dealer bust, player wins
7. Compare cards and declare winner.