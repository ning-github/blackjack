class window.Card extends Backbone.Model
  initialize: (params) ->
    @set
      # for the UI all cards are revealed when dealt
      revealed: true
      value: if !params.rank or 10 < params.rank then 10 else params.rank
      suitName: ['Spades', 'Diamonds', 'Clubs', 'Hearts'][params.suit]
      rankName: switch params.rank
        when 0 then 'King'
        when 1 then 'Ace'
        when 11 then 'Jack'
        when 12 then 'Queen'
        else params.rank

  # flipping a card CONCEALS it
  flip: ->
    @set 'revealed', !@get 'revealed'
    @

