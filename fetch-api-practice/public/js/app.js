let content = fetch('http://localhost:4567/books.json')
  .then(response => {
    if (response.ok) {
      return response;
    } else {
      let errorMessage = `${response.status} (${response.statusText})`,
        error = new Error(errorMessage);
      throw (error);
    }
  })
  .then(response => response.text())
  .then(body => {
    // console.log(body);//THIS IS A STRING
    //result
    //{"books":[{"id":1,"name":"my first book"},{"id":2,"name":"book from cURL"},{"id":3,"name":"book from fetch"}]}
    // app.js:17 {"books":[{"id":1,"name":"my first book"},{"id":2,"name":"book from cURL"},{"id":3,"name":"book from fetch"}]}
    let bodyParsed = JSON.parse(body);
    //console.log(typeof bodyParsed); //THIS IS AN OBJECT
    let bodyUl = document.getElementById('books');
    bookhash = Object.keys(bodyParsed).forEach(function(key, value) {
      // console.log(key, bodyParsed[key][0]['name']);
      bodyParsed[key].forEach(function(item) {
        // console.log(item.name)
        let eachLi = document.createElement('li');
        eachLi.innerHTML = `${item.name}`;
        bodyUl.appendChild(eachLi);
      });
    });
    // your code here
  })
  .catch(error => console.error(`Error in fetch: ${error.message}`));
