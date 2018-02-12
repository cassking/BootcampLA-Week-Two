import './app.scss';
import React from 'react';
import ReactDOM from 'react-dom';
import Popup from './components/Popup'
import Message from './components/Message'



ReactDOM.render(
  <Popup singer = "Rick Roll" />,
  document.getElementById('popup')
);

ReactDOM.render(
  <Message text = "You clicked me and I am the {props.text} and you get secret Rick Roll treatment!" />,
  document.getElementById('message')
);
