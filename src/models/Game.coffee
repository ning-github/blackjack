class window.Game extends Backbone.Model
  initialize: (@playerHand, @dealerHand) ->
    @get('playerHand').on 'hit' , @checkPlayerScore, @
    @get('dealerHand').on 'hit' , @checkDealerScore, @

  checkPlayerScore: ->
    handScores = @get('playerHand').scores()
    if handScores[0] == 21 or handScores[1] == 21
      console.log 'win'
      @trigger 'win'
    else if Math.min.apply(null, handScores) > 21
      console.log 'busted'
      @trigger 'busted'


