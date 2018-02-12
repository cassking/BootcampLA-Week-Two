import React from 'react';
const Message = props => {

let clickyTheFunction = () => {
  alert(`Hola from Message component bonus thingie: ${props.text}`)
}
  return(
    <div>
    <p className="bonus" onClick={clickyTheFunction}> Click me for super duper bonus </p>
    </div>

  );

};

export default Message;
