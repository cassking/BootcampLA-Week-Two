let latitude = 39.96;
let longitude = 75.16;
let mainContainer = document.getElementById('main');
let API = 'https://api.darksky.net/forecast/d6e4c65ef34b3aa742a66a08cfcbbe7b/39.96,75.16';

fetch(`#{API}`).then(response => {
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
    console.log(body);//THIS IS A STRING

   let bodyParsed = JSON.parse(body);
console.log(typeof bodyParsed); //THIS IS AN OBJECT
   let bodyUl = document.getElementById('books');
   bookhash = Object.keys(bodyParsed).forEach(function(key, value) {
      console.log(key, bodyParsed[key][0]['name']);
     bodyParsed[key].forEach(function(item) {
        console.log(item.name)
       let eachLi = document.createElement('li');
       eachLi.innerHTML = `${item.name}`;
       bodyUl.appendChild(eachLi);
     });
   });
   // your code here
 })
 .catch(error => console.error(`Error in fetch: ${error.message}`));
