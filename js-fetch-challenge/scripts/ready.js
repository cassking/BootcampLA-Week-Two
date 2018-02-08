let ready = () => {
  return new Promise( (resolve) => {
    document.addEventListener('readystatechange', event => {
      if (event.target.readyState === "complete") {
        resolve();
      }
    });
  });
  //end promise
};
//end ready()
