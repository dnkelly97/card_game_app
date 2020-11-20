Feature: Allow CardGameSim user to transfer card from one pile to another

  Scenario: Transfer a card to an empty pile (Declarative)
    #Given that at least one pile exists in the database
    And the following cards have been added to the pile whose id is 1:
      | name                    | pile_id |
      | Ace of Spades           | 1       |
      | Two of Spades           | 1       |
      | Three of Spades         | 1       |
      | Four of Spades          | 1       |
      | Five of Spades          | 1       |
      | Six of Spades           | 1       |
      | Seven of Spades         | 1       |
      | Eight of Spades         | 1       |
      | Nine of Spades          | 1       |
      | Ten of Spades           | 1       |
    #When I have created a pile with name "P1_Pile" and creator "Gabriel" and privacy_pile set to true
    #And I have tried to transfer the Ace of Spades from pile with id=1 to pile with name "P1_Pile"
   # Then I should see the Ace of Spades in the previously empty pile: "P1_Pile"
