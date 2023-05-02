# Digimarket
Digimarket open source code

## DigiMarket Setup on EC2

### `Socket.io` setup
1.	Install Node on the EC2 server. Download the latest LTS version from https://nodejs.org/en/download. We used v18.16.0
2.	Download the code from socket.io sample
https://github.com/socketio/socket.io/tree/main/examples/typescript
3.	Launch a command prompt and navigate to the folder
4.	Run the command `npm install` 
5.	Run the command `npm run start:server`
6.	The socket.io server should now ne listening on localhost:3001

### IIS Setup

Application Request Routing (ARR) Setup

1.	Install Application Request Routing v3  Module https://www.microsoft.com/en-us/download/details.aspx?id=47333
2.	Go at Server level in `IIS > ARR` and ensure `Enable proxy` is checked.

![](https://github.com/Digimarket-open-source/Digimarket/blob/main/Enabling_Proxy.png) 
