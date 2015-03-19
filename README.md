Quick start:

```yml
# config/application.yml
pusher_key: 
pusher_secret: 
```

`bundle install`
`bundle exec rake db:create db:migrate`

Related Socket.io Service: https://github.com/w1zeman1p/presence_demo_node_microservice

---

http://goo.gl/D2JE32

# Who's online

**CJ Avilla**

@w1zeman1p

---

### OPTION 1 - Last seen:

+ Every time a controller action fires, touch the current user, then
compile a list of online users based on `User#updated_at`.

**Considerations**: If we're going to be selecting users based on
`updated_at` we might want to add an index to speed up that search.
However, because we're going to be updating the user on every single
request, keeping that index up-to date is going to be expensive.

Also, how do you choose what the duration of delay should be? This is
completely unrelated to the browser window being open and the user
viewing the site.

---

### OPTION 2 (Cache of users):

+ Every time a user is logged in, add them to a cache of users, then
attempt to track when they close the browser and remove them from the
cache.

Tricky business: unload requires some special attention.
http://stackoverflow.com/questions/4945932/window-onbeforeunload-ajax-request-problem-with-chrome

If this isn't a single page app and the page is making full refreshes
often then, an extra consideration needs to be made.

1) Client sends disconnect request on refresh
2) Server adds to a queue of possible disconnections
3) If client page is reloaded, then the request to disconnect is
canceled.

http://stackoverflow.com/questions/568977/identifying-between-refresh-and-close-browser-actions/13916847#13916847

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
