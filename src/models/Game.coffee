class window.Game extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    # deck has methods that are invokations of Hand (for player and dealer)
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()


  # a function that can listen for everything
  listen: ->
    # if player busted or stood
    @get('playerHand').on 'busted'
    @get('playerHand').on 'stand'
      # if the player stands, it is time to begin dealerHit

    # if dealer busted, player wins

    # if dealer stands, time to compare player bestScore to dealer bestScore



  #
  # initialize: (@playerHand, @dealerHand) ->
  #   @get('playerHand').on 'hit' , @checkPlayerScore, @
  #   @get('dealerHand').on 'hit' , @checkDealerScore, @

  # checkPlayerScore: ->
  #   handScores = @get('playerHand').scores()
  #   if handScores[0] == 21 or handScores[1] == 21
  #     console.log 'win'
  #     @trigger 'win'
  #   else if Math.min.apply(null, handScores) > 21
  #     console.log 'busted'
  #     @trigger 'busted'


