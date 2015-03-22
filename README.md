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

<img src="http://www.curata.com/blog/wp-content/uploads/2015/01/web-traffic-meme.jpg">
---

### OPTION 1 - Last seen:

[code!](https://gist.github.com/w1zeman1p/17ae623444e9e85609e2)

+ Always touch the current user and
compile a list of online users based on `User#updated_at`.

**Considerations**: 

Can we make this faster:

User.where('updated_at > ?', 180.seconds.ago)

How do we choose an appropriate delay?

---

### OPTION 2 (Cache of users)
<img src="http://www.quickmeme.com/img/6f/6f959f1ae43f3f29bd3b0ff2cbe686c96f96c631c6e90f844c264e2b25691b25.jpg">
---

### OPTION 2 (Cache of users):

[code!](https://gist.github.com/w1zeman1p/998aa864ba99d4ef866e)

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

### OPTION 3/4 Websockets!

<img src="http://cdn.meme.am/instances/500x/54276715.jpg">

---

### OPTION 3 - Pusher:

[code!](https://gist.github.com/w1zeman1p/980db3be732dabe180eb)

https://pusher.com/

+ Use pusher presence channel
+ $$$$


Slanger is an open source alternative:
https://github.com/stevegraham/slanger

---

### OPTION 4 - socket.io:

[code!](https://gist.github.com/w1zeman1p/a0203e494283aaf4bda9)

http://goo.gl/fB2t5g

+ Use a Node.js/IO.js service that runs socket.io

Very flexible :)

---

# Existing Solutions
+ Last Seen (Date)
+ Cache (explore in more detail)
http://www.ryanepp.com/blog/how-do-i-tell-if-a-user-is-online
+ Pusher presence channel
+ Node.js socket.io service
+ Pubnub?
+ Firebase?

