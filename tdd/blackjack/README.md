# Blackjack

## Objectives
* -[ ] - Two Players
  * -[ ] - Dealer
  * -[ ] - Player
    * Player as a Struct?
* -[ ] - Rules
  * -[ ] - Card Values
    * -[ ] - 1 deck of 52 cards
    * -[x] - Cards are equal to number value (2, 3, 4, 5, 6, 7, 8, 9, 10)
    * -[x] - Face cards are valued at 10 ( jack, queen, king )
    * -[ ] - Ace can be an 11 or 1
  * -[ ] - Player vs. Dealer
    * -[ ] - Closest to 21 wins
    * -[ ] - Over 21 is a bust
    * -[ ] - Can hit (add a card)
    * -[ ] - Can stand (keep cards)
    * -[ ] - Ace and 10 or face card is BLACKJACK

## Relationships
* -[ ] - Cards and Deck
  * -[x] - 52 Cards in a deck
  * -[x] - 4 Suits ("Spade", "Clubs", "Hearts", "Diamonds")
    * -[x] - 13 Cards per suit ("Ace", 2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "Queen", "King")
* -[ ] - Players and Cards
  * -[ ] - Deal
    * -[ ] - Each player starts with two cards
      * -[ ] - Player(card 1), Dealer(card 1), Player(card 2), Dealer(card 2)
    * -[ ] - Player decides to hit or stay depending on score
      * -[ ] - Hit -> add one card, check score(stand, hit, bust)
      * -[ ] - Stand -> Total card values
    * -[ ] - Dealer goes after player
      * -[ ] - Dealer must hit if <= 16
      * -[ ] - Otherwise Same Rules as player
    * -[ ] - In the case of a tie, result is a push (tie)

# Data Modeling for TDD
## What Tests can we write?

* - Existence Tests
  * - Game
  * - Card
  * - Deck
* - Attributes and Initialization Tests
  * - Game
    * - Game is initialized with a new Deck
    * - Game is initialized with a Player having two cards
      * - Player has a hand of Cards
    * - Game has the rules attributes
  * - Card
    * - Card initialized with a suit and value
    * - Card class should state what all cards are
  * - Deck
    * - Deck is initialized with 52 unique cards
    * - Deck can be shuffled
    * - Deck can remove a card after dealt
