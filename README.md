# Presence / Who's online

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
+ A little better: keep an LRU cache of users who visit the site.
+ Best?: Hash that's updated when someone joins/leaves

### OPTION 1:

+ Every time a controller aciton fires, touch the current user, then
compile a list of online users based on `User#updated_at`.


