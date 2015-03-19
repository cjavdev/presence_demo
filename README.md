Quick start:

```yml
# config/application.yml
pusher_key: 
pusher_secret: 
```

`bundle install`
`bundle exec rake db:create db:migrate`

Related Socket.io Service:
https://github.com/w1zeman1p/presence_demo_node_microservice

---

http://goo.gl/D2JE32

# Who's online

**CJ Avilla**

@w1zeman1p

---

### OPTION 1 - Last seen

last login + delay

---

### OPTION 1 - Last seen:

code!

+ Always touch the current user and
compile a list of online users based on `User#updated_at`.

**Considerations**: 

Can we make this faster:

User.where('updated_at > ?', 180.seconds.ago)

How do we choose an appropriate delay?

---

### OPTION 2 (Cache of users):

---

### OPTION 2 (Cache of users):

Keep a cache of users and _attempt_ to track when they close the browser and
remove them.

Problems?:

1. Unload requires some special attention
2. Determining the difference between browser refresh and tab/browser close.


http://goo.gl/RCBEFR

1. Client sends disconnect request on refresh
2. Server adds to a queue of possible disconnections
3. If client page is reloaded, then the request to disconnect is canceled.

http://goo.gl/D0zeeq

---

### OPTION 3 - Pusher:

https://pusher.com/

+ Use pusher presence channel

Slanger is an open source alternative:
https://github.com/stevegraham/slanger

---

### OPTION 4 - socket.io:

http://goo.gl/fB2t5g

+ Use a Node.js service that runs socket.io

This allows you to build out the logic for handling realtime things in a
different service.

---

# Existing Solutions
+ Last Seen (Date)
+ Cache (explore in more detail)
http://www.ryanepp.com/blog/how-do-i-tell-if-a-user-is-online
+ Pusher presence channel
+ Node.js socket.io service
+ Pubnub?
+ Firebase?

