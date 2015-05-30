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
    @listenTo @get('game'), 'win busted', @redeal

  redeal: ->
    @set 'playerHand', @get('deck').dealPlayer()
    console.log @get 'playerHand'
    @set 'dealerHand', @get('deck').dealDealer()
    console.log @get 'dealerHand'
    # need to set a new game object
    #   ex) playerHand used to point to a certain hand
    #       - that is the hand of cards array given to the 'game' on line 10
    #       once you point playerHand to something new, 'game' is still
    #       pointing to the old hand array (because it's own label wasn't peeled)
    #     THEREFORE, 'game' needs to be instantiated
    @set 'game', game = new Game(
      playerHand: @get 'playerHand'
      dealerHand: @get 'dealerHand'
      )

    @trigger 'rerender'

