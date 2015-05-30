class window.Deck extends Backbone.Collection
  model: Card

  initialize: ->
    @add _([0...52]).shuffle().map (card) ->
      new Card
        rank: card % 13
        suit: Math.floor(card / 13)
  # the deck instance of Deck is a an array
  # when a hand is dealt to the player, you're popping two cards off the deck
  dealPlayer: -> new Hand [@pop(), @pop()], @

  # when a hand is dealt to the dealer, you're popping one card and UNrevealing it (flip)
  #   and your also just regular dealing (pop) the other hand
  dealDealer: -> new Hand [@pop().flip(), @pop()], @, true

