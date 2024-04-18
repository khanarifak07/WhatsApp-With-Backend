import express from 'express';
import http from 'http';
import { Server as socketIO } from 'socket.io';

const app = express();
const server = http.createServer(app);
const io = new socketIO(server);

app.use(express.json());

io.on('connection', (socket) => {
  console.log('Connected');
  console.log(socket.id, 'Has Joined');
  socket.on('/test', (message) => {
    console.log(message);
  });
});

const port = process.env.PORT || 3000;
server.listen(port, () => {
  console.log(`Server is listening at port ${port}`);
});