faye-lost-messages
==================

*Summary:* When faye client's connection is dropped, and messages are sent during that time to the channel
the client is subscribed to, messages get buffered. However, after the client is reconnected, 
not all missed messages are received from the server.

Steps to reproduce: 

1. Run "foreman start" to start faye and rails server (or do these separately)
2. Open a browser window at http://localhost:3000/server 
3. Open another browser window (possibly at another machine) at http://your_app_host_here:3000/client
4. Click on "Increment value" on "/server" to verify that messages get delivered
5. Disconnect the machine where "/client" is opened. I am doing this in Windows by doing a "ipconfig /release" 
6. Click on "Increment value" more than once 
7. Reconnect the "/client" machine (Windows: ipconfig /renew), and wait for buffered messages to arrive. 
8. Observe some numbers (probably one or two first ones) in the sequence missing

