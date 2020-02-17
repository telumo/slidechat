const { Elm } = require("./Main.elm");

import Amplify from 'aws-amplify';
import aws_exports from './aws-exports';
import API, { graphqlOperation } from '@aws-amplify/api';
import { createComment } from './graphql/mutations';
import { onCreateComment } from './graphql/subscriptions';

Amplify.configure(aws_exports);


var app = Elm.Main.init({});
// ElmからJSへ
app.ports.sendMessage.subscribe(async (data) => {

  const commentData = {
    input: {
      text: data
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
    const random = Math.floor(Math.random() * (80 - 20) + 20)

    // JSからElmへ
    app.ports.catchMessage.send(text + "," + random)
  },
})