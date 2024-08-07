const core = require('@actions/core');
const github = require('@actions/github');

try {
  // `name` input defined in action metadata file
  const name = core.getInput('name');
  console.log(`Hello ${name}!`);

  // Get the current time
  const time = (new Date()).toTimeString();
  core.setOutput("time", time);

  // Get the JSON webhook payload for the event that triggered the workflow
  const payload = JSON.stringify(github.context.payload, undefined, 2)
  console.log(`The event payload: ${payload}`);
} catch (error) {
  core.setFailed(error.message);
}
