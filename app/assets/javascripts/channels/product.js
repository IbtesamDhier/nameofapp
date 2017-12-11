App.product = App.cable.subscriptions.create("ProductChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  //alert("conected")
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
   
    //alert("received")
    $(".alert.alert-info").show();
    $( ".alert" ).delay( 3000 ).fadeOut( 3000 );
    $('.product-reviews').prepend(data.comment);
    $("#average-rating").attr('data-score', data.average_rating);
    refreshRating();
  },

  listen_to_comments: function() {
  	//alert("listen")
  	return this.perform('listen', {
      product_id: $("[data-product-id]").data("product-id")
  	});
  }
});

$(document).on('turbolinks:load', function() {
  App.product.listen_to_comments();
});