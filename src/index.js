const { Elm } = require("./Main.elm");

import Amplify from 'aws-amplify';
import aws_exports from './aws-exports';
import API, { graphqlOperation } from '@aws-amplify/api';
import { createComment } from './graphql/mutations'
import { onCreateComment } from './graphql/subscriptions';

Amplify.configure(aws_exports);


var app = Elm.Main.init({});
// ElmからJSへ
app.ports.sendMessage.subscribe(async (data) => {
  const random = Math.floor(Math.random() * (80 - 20) + 20)
  const commentData = {
    input: {
      text: data,
      command: " ",
      random: random
    }
  }
  // データを送信
  await API.graphql(graphqlOperation(createComment, commentData))
})


// データの購読
API.graphql(
  graphqlOperation(onCreateComment)
).subscribe({
  next: eventData => {
    const text = eventData.value.data.onCreateComment.text
    const command = eventData.value.data.onCreateComment.command
    const random = eventData.value.data.onCreateComment.random
    // JSからElmへ
    const data = { 
      text: text,
      command: command,
      random: random
    }
    app.ports.catchMessage.send(data)
  },
})