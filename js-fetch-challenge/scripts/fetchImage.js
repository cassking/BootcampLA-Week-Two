ready().then(() => {
  //
  let mainDiv = document.getElementById("main");
  theClickedLink = event.target; //use this to store event.target
  theClickedLink.addEventListener("click", function(event) {
    event.preventDefault(); //prevent going to page
    if (event.target.nodeName == "A") {
    //  console.log(event.target + " "+  theClickedLink + " was clicked");
  //  begin fetch
        fetch(event.target.href)
        .then( (response) => {
          let imageBlob = response.url; //the file
          // //get a response object here (blob)
          let img = document.createElement("img");
          img.src = imageBlob;
          mainDiv.appendChild(img);
        });
      //end fetch
    }
  });

});
