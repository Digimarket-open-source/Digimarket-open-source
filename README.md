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

![image](https://user-images.githubusercontent.com/1287634/235748637-1491216e-3a7f-4a1b-ae23-2f17f5810733.png)

Click Server Proxy Settings and then check the Enable proxy checkbox. Keep all other settings as it is.

![image](https://user-images.githubusercontent.com/1287634/235748954-ce2a37fb-586e-452e-9de7-10d724f52fba.png)

### Url Rewrite
1.	Install UrlRewrite module https://www.iis.net/downloads/microsoft/url-rewrite
2.	Setup the Url rewrite rule for reverse proxy at the server level
3.	Select the server node and then double click the Url Rewrite in the right pane

![image](https://user-images.githubusercontent.com/1287634/235749099-f5a69aab-5023-4682-b1e2-87a6afa290c3.png)

4.	Select Add Rule and then Blank Rule

![image](https://user-images.githubusercontent.com/1287634/235749217-9236ef99-05ce-454a-8de8-ed98fcb2406d.png)

5. Fill in the details as follows:

Name: ReverseProxy localhost:4001 (could be any descriptive name)
Pattern: (.*)

![image](https://user-images.githubusercontent.com/1287634/235749562-dbb7ba57-ddaa-40c8-b428-d85fdb57fd6b.png)

