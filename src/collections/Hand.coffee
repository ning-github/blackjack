class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->

  # when the hand object is hitting, it adds another card popped off the deck collection
  hit: ->
    temp = @deck.pop()
    @add(temp)
    # trigger bust if your lowest possible score goes over
    #   a win trigger isn't needed since you would eventually stand
    if @minScore() > 21 then @trigger 'busted'

  # stand function
  stand: ->
    @trigger 'stand'

  # recall that hand is a Collection (array)
  #   hasAce iterates over each card in the hand and
  #   returns true if it finds an ace in the hand (value of 1) or 0 if it doesnt
  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  #   will sum up and return the value of the cards in the hand
  #     note: will check dealer hand as well, but only the revealed
  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores
    # - the original score, and score + 10. *note: 10 * true is 10
    [@minScore(), @minScore() + 10 * @hasAce()]

  bestScore: ->
    if @scores()[1] <=21 then @scores()[1] else @scores()[0]

  dealerPlay: ->
    console.log 'dealer turn now'
    # reveal card
    @at(0).flip()
    # hit until  17
    @hit() while @minScore() < 17
    if @bestScore() < 22
      @stand()
