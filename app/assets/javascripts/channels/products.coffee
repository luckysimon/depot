App.products = App.cable.subscriptions.create "ProductsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # data is a javascript object => {html: ""}
    # get the html content in the object,use data.html in js.
    # Called when there's incoming data on the websocket for this channel.
    # Then update the content of class= "store" (the store/ folder) id="main" content => actually the <%= yield %> part
    # Using the content in data
    $(".store #main").html(data.html)
   
