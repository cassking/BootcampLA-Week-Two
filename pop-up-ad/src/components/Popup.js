import React from 'react';
const Popup = props => {

  let getname = prompt("Welcome to our SPAMMY site! What is your name?");
  let getVisitorName = props => {
    if (getname === null) {
          getname = String(getname)+"hello fan";
          console.log(getname);
   } else {
    getname;
   }
  }
  let handleTryClosingAd = () => {
   confirm(`${getname} Are you sure you don't want to see ${props.singer}?`)
 }
  let formSubmission = () => {
    alert(`${getname} your form was submitted`)
  }
   return(
  <div>
    <div className="save button close" onClick={handleTryClosingAd}>
   X
  </div>
    <div>
      <h1>{getname}<br /> You have won tickets go see {props.singer}!!</h1>
      <h3>Please enter your email so we can send you the tickets</h3>
    </div>

    <div className="form-container">
      <form>
      <div className="grid-container">
      <div className="grid-x grid-padding-x">
        <div className="large-12 cell">
        <label htmlFor='email'>Your Email:</label>
        <input type='text' id='email' />
        {/* on clicking this do something
          see: https://medium.com/@everdimension/how-to-handle-forms-with-just-react-ac066c48bd4f*/}
          {/* y default, button elements are of the type "submit" which causes them to submit their enclosing form element (if any). Changing the type to "button" prevents that.
           */}
        <button className="button expanded" type='button' id='submit' value='' onClick={formSubmission}>CLAIM YOUR PRIZE</button>
        </div>
          </div>
        </div>
      </form>
    </div>

  </div>
   );
};

export default Popup;
