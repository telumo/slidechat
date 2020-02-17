const { Elm } = require("./Main.elm");

var app = Elm.Main.init({});
// Elm側からJSへ
app.ports.sendMessage.subscribe(function(data) {
  console.log(data)
  var random = Math.floor(Math.random() * ( 80 - 20 ) + 20);
  console.log(random + "," + random)
  // JS側からElmへ
  app.ports.catchMessage.send(data + "," + random)
});