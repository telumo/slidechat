const { Elm } = require("./Main.elm");

// Load initial state from localStorage
// var initialState;
// try {
//   initialState = JSON.parse(localStorage.getItem("elm-flatris"));
// } catch (e) {}

var app = Elm.Main.init({
  node: document.getElementById("main"),
//   flags: initialState
});
// app.ports.save.subscribe(function(state) {
//   // Save game state to localStorage
//   localStorage.setItem("elm-flatris", state);
// });

// // Prevent scrolling with arrow and space keys
// window.addEventListener(
//   "keydown",
//   function(e) {
//     if ([32, 37, 38, 39, 40].indexOf(e.keyCode) > -1) {
//       e.preventDefault();
//     }
//   },
//   false
// );

// // Capture focus
// window.focus();