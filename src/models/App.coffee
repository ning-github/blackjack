# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    # deck.dealPlayer is an instance of Hand (dealplayer is a function of Deck that invokes new Hand())
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @set 'game', game = new Game(
      playerHand: @get 'playerHand'
      dealerHand: @get 'dealerHand'
      )
