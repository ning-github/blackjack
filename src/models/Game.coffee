class window.Game extends Backbone.Model
  initialize: (@playerHand, @dealerHand) ->
    @get('playerHand').on 'add' , @checkScore, @
    @get('dealerHand').on 'add' , @checkScore, @

  checkScore: ->
    console.log @get('playerHand')
    handScores = @get('playerHand').scores()
    # if @this is player or dealer
    if Math.min.apply(null, handScores) == 21
      console.log 'win'
      @trigger 'win'
      # set some end of game flag
    else if Math.min.apply(null, handScores) > 21
      @trigger 'busted'
      console.log 'bust'
      # set some end of game flag

  disable: ->
    # disable hit and stand button, show new game button
