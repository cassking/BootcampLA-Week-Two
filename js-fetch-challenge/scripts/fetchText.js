ready().then(() => {
  // your code, here
  let myUL = document.getElementsByTagName('ul')[0];
  let mainDiv = document.getElementById("main");
  let theClickedLink = ""; //use this to store event.target
  myUL.addEventListener("click", function(event) {
    event.preventDefault(); //prevent going to page
    if (event.target.nodeName == "A") {
      theClickedLink = event.target;
      console.log(event.target + " was clicked");
      //begin fetch
      fetch(theClickedLink).then(function(response) {
        response.text().then(function(text) {
          mainDiv.textContent = text;
        });
      });
      //end fetch
    }
  },false);
});
