class window.Game extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    # listen is what actually deals new Hands
    @listen()

  # a function that can listen for everything
  listen: ->
    # deck has methods that are invokations of Hand (for player and dealer)
    # this is so that when listen is called again, new hands are dealt out 
    # (it's like re-initializing but with same deck)
    @set 'playerHand', @get('deck').dealPlayer()
    @set 'dealerHand', @get('deck').dealDealer()

    # if player busted or stood
    @get('playerHand').on 'busted', ->
      console.log 'you bustedddd, YOU LOSE'
      @listen()
    , @
    # if the player stands, it is time to begin dealerHit
    @get('playerHand').on 'stand', ->
      @get('dealerHand').dealerPlay()
    , @

    # if dealer busted, player wins
    @get('dealerHand').on 'busted', ->
      console.log('dealer busted, YOU WIN!!')
      @listen()
    , @

    # if dealer stands, time to compare player bestScore to dealer bestScore
    @get('dealerHand').on 'stand', ->
      playerScore = @get('playerHand').bestScore()
      dealerScore = @get('dealerHand').bestScore()
      if playerScore > dealerScore then console.log 'your hand is higher! YOU WIN'
      if playerScore == dealerScore then console.log 'push'
      if playerScore < dealerScore then console.log 'your hand is lower. YOU LOSE'
      @listen()
    , @







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


