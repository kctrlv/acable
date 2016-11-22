App.games = App.cable.subscriptions.create "GamesChannel",
  connected: ->
    @perform 'connect_user'
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server
    
  userConnect: (data) ->
    html = """
           <li id=user_#{data['uid']}>
             #{data['name']}
           </li>
           """
    $('.online-users').append(html) if ($("#user_#{data['uid']}").length == 0)

  userDisconnect: (data) ->
    $("#user_#{data['uid']}").remove()

  userConnection: (data) ->
    switch data.action
      when 'connect'
        App.games.userConnect(data)
      when 'disconnect'
        App.games.userDisconnect(data)


  received: (data) ->
    switch data.model
      when 'user'
        App.games.userConnection(data)


    # Called when there's incoming data on the websocket for this channel
