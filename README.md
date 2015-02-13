```yml
# config/application.yml
pusher_key: 
pusher_secret: 
```

`bundle install`
`bundle exec rake db:create db:migrate`

# Presence / Who's online

+ Chat
+ Collaborators on a document

[Seems
hard?](http://help.soundcloud.com/customer/portal/articles/1485216-where-did-who-s-online-go-)

What's needed:

+ Collection of users
+ Knowledge of when someone joins/leaves
+ Ability to update everyone (in real time?)

# Collection of users

+ `User < ActiveRecord::Base`

# Knowledge of when someone joins/leaves

+ Naiive approach would be to have the list of who's online be anyone
with an updated at in the last X min. Send the list of online users with
each request. Rely on the database to give you the correct users based
on a where clause.
+ A little better: Keep a cache of users and manually add, remove as
they interact with the site.
+ Best?: Hash that's updated when someone joins/leaves.

### OPTION 1:

+ Every time a controller action fires, touch the current user, then
compile a list of online users based on `User#updated_at`.

**Considerations**: If we're going to be selecting users based on
`updated_at` we might want to add an index to speed up that search.
However, because we're going to be updating the user on every single
request, keeping that index up-to date is going to be expensive.

Also, how do you choose what the duration of delay should be? This is
completely unrelated to the browser window being open and the user
viewing the site.

### OPTION 2:

+ Every time a user is logged in, add them to a cache of users, then
attempt to track when they close the browser and remove them from the
cache.

Tricky business: unload requires some special attention. http://stackoverflow.com/questions/4945932/window-onbeforeunload-ajax-request-problem-with-chrome

If this isn't a single page app and the page is making full refreshes
often then, an extra consideration needs to be made.

1) Client sends disconnect request on refresh
2) Server adds to a queue of possible disconnections
3) If client page is reloaded, then the request to disconnect is
canceled.

http://stackoverflow.com/questions/568977/identifying-between-refresh-and-close-browser-actions/13916847#13916847

### OPTION 3:

+ Use pusher presence channel

Slanger is an open source alternative: https://github.com/stevegraham/slanger
