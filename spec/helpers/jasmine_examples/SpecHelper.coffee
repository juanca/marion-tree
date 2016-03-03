beforeEach ->
  jasmine.addMatchers
    toBePlaying: ->
      compare: (actual, expected) ->
        player = actual

        pass: player.currentlyPlayingSong == expected && player.isPlaying
