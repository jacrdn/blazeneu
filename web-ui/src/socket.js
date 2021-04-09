import {Socket} from "phoenix";

let socket = new Socket(
  "ws:localhost:4000/sockett",
  {params: {token: ""}}
);
socket.connect();

//this should change
let channel = socket.channel("game:login", {});

let state = {
  numEntries: 5,
};

let callback = null;

// The server sent us a new state.
function state_update(st) {
  state = st;
  if (callback) {
    callback(st);
  }
}

export function ch_join(cb) {
  callback = cb;
  callback(state);
}


channel.join()
       .receive("ok", state_update)
       .receive("error", resp => {
         console.log("Unable to join", resp)
       });

channel.on("view", state_update);