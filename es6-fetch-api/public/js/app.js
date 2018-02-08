//app.js

// fetch('http://localhost:4567/test_error')
//  .then(response => {
//    console.log('response', response);
//    console.log('response.status:', response.status);
//    console.log('response.statusText:', response.statusText);
//    console.log('response.ok:', response.ok);
//    return response.text();
//  })
//  .then(responseBody => {
//    console.log('responseBody:', responseBody);
//  });








// fetch('http://localhost:4567/test_error')
//   .then(response => {
//     if (response.ok) {
//       return response;
//     } else {
//       let errorMessage = `${response.status} (${response.statusText})`,
//           error = new Error(errorMessage);
//       throw(error);
//     }
//   })
//   .then(response => {
//     console.log('response', response);
//     console.log('response.status:', response.status);
//     console.log('response.statusText:', response.statusText);
//     console.log('response.ok:', response.ok);
//     return response.text();
//   })
//   .then(responseBody => {
//     console.log('responseBody:', responseBody);
//   })
//   .catch(error => console.error(`Error in fetch: ${error.message}`));





  fetch('http://localhost:4567/books.json')
  .then(response => {
    debugger
    if (response.ok) {
      return response;
    } else {
      let errorMessage = `${response.status} (${response.statusText})`,
          error = new Error(errorMessage);
      throw(error);
    }
  })
  .then(response => response.text())
  .then(body => {
    debugger
    console.log(body);
    let bodyParsed = JSON.parse(body);
    console.log(bodyParsed);
  })
  .catch(error => console.error(`Error in fetch: ${error.message}`));











//
// fetch('http://localhost:4567/books.json')
//   .then(response => {
//     if (response.ok) {
//       return response;
//     } else {
//       let errorMessage = `${response.status} (${response.statusText})`,
//           error = new Error(errorMessage);
//       throw(error);
//     }
//   })
//   .then(response => response.json())
//   .then(body => {
//     console.log(body);
//   })
//   .catch(error => console.error(`Error in fetch: ${error.message}`));


// let data = {
//   book: {
//     name: 'book from fetch'
//   }
// };
// let jsonStringData = JSON.stringify(data);
//
// fetch('http://localhost:4567/books.json', {
//   method: 'post',
//   body: jsonStringData
// })
//   .then(response => {
//     if (response.ok) {
//       return response;
//     } else {
//       let errorMessage = `${response.status} (${response.statusText})`,
//           error = new Error(errorMessage);
//       throw(error);
//     }
//   })
//   .then(response => response.json())
//   .then(body => {
//     console.log(body);
//   })
//   .catch(error => console.error(`Error in fetch: ${error.message}`));
