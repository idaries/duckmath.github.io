// This is the file that the "start" script in package.json will execute.
// It sets up a basic web server.

const express = require('express');
const app = express();

// Cloud Run automatically sets the PORT environment variable.
// We must use this variable for the server to listen on the correct port.
const PORT = process.env.PORT || 8080;

app.get('/', (req, res) => {
  // Respond to a GET request to the root path
  const message = 'Hello from Cloud Run! Your Node.js app is running.';
  console.log(`Sending response: ${message}`);
  res.status(200).send(message);
});

app.listen(PORT, () => {
  console.log(`Web server listening on port ${PORT}`);
});
