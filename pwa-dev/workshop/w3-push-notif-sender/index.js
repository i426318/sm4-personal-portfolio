//Setup libraries we want to use (installed them first with *npm install*)
const webpush = require("web-push");
const fetch = require("node-fetch");
const prompts = require("prompts");

//Location of your subscribers file (normally they would be in a database)
const yourSubscriberJSONFileURL =
  "https://www.i426318.hera.fhict.nl/data/subscribers.json";

//Place your keys here
webpush.setVapidDetails(
  "mailto:w.biantoro@student.fontys.nl", //Subject VAPID
  "BIU_a4odFqF7yRn01o6j0IeMTu9CF5IwyXBjPTed5yiy5RLn_2Ncc-hg-tzeioviyzmGGqR9DxfEk8lFIDdQ0q4", // Public Key VAPID
  "uNbzK9Su9tw-Q_9pXrWoSL7qdD56KgSZ496N6oHIgKA" //Private Key VAPID
);

console.log(
  " ==========================================\n",
  "==       SEND PUSH NOTIFICATION         ==\n",
  "==========================================\n"
);

//This allows you to fill in the titel and message of the notification in the CLI
const questions = [
  {
    type: "text",
    name: "title",
    message: "Push notification title"
  },
  {
    type: "text",
    name: "message",
    message: "Push notification message"
  }
];

(async () => {
  const answers = await prompts(questions);

  console.log(
    "\n ==========================================\n",
    "==    SENDING MESSAGE TO SUBSCRIBERS    ==\n",
    "==========================================\n"
  );

  //Putting the promted title and message in variables to use
  let pushTitle = answers.title;
  let pushMessage = answers.message;

  //Send a notification to every subscriber
  fetch(yourSubscriberJSONFileURL)
    .then(subscriberJSON => subscriberJSON.json())
    .then(subscriberJSON => {
      for (let subscriberEndpoint in subscriberJSON) {
        //Setting up format of subcription for sending
        const pushSubscription = {
          endpoint: subscriberEndpoint,
          keys: {
            auth: subscriberJSON[subscriberEndpoint]["keys"]["auth"],
            p256dh: subscriberJSON[subscriberEndpoint]["keys"]["p256dh"]
          }
        };
        //Actual sending
        webpush
          .sendNotification(
            pushSubscription,
            `{"title":"${pushTitle}","message":"${pushMessage}"}`
          )
          .then(result => {
            console.log(`-- Message send to ${pushSubscription.endpoint}`);
          })
          .catch(error => {
            console.log(`-- Message NOT send to ${pushSubscription.endpoint}`);
          });
      }
    });
})();
