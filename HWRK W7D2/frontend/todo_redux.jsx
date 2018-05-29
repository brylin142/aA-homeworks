import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  const store = configureStore(preloadedState);

  // store.dispatch = addLoggingToDispatch(store);
  // store = applyMiddlewares(store, addLoggingToDispatch);

  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});

// const addLoggingToDispatch = (store) => {
//   const dispatchEl = store.dispatch;
//   return (action) => {
//     console.log(store.getState());
//     console.log(action);
//     dispatchEl(action);
//     console.log(store.getState());
//   };
// };

// const applyMiddlewares = (store, ...middlewares) => {
//   const dispatch = store.dispatch;
//   middlewares.forEach( middleware => {
//     dispatch = middleware(store)(dispatch);
//   });
//   Object.assign({}, store, { dispatch });
// };
