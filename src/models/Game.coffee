class window.Game extends Backbone.Model
  initialize: (@playerHand, @dealerHand) ->
    @get('playerHand').on 'add' , @checkScore, @
    @get('dealerHand').on 'add' , @checkScore, @

  checkScore: ->
    handScores = @get('playerHand').scores()
    # if @this is player or dealer
    if Math.max.apply(null, handScores) == 21
      alert 'win'
      @trigger 'win'
      # set some end of game flag
    else if Math.min.apply(null, handScores) > 21
      #alert 'bust'
      @trigger 'busted'
      # set some end of game flag

  disable: ->
    # disable hit and stand button, show new game button
