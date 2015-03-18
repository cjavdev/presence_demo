Super stoked to see all of you and excited to welcome you to this
interactive demo of **presence**. This room is a simulated web
application. You are all users of the site, this foreword is a
landing page and to see the rest of the presentation you'll need to
authenticate. As you may have noticed this site is not HTTPS nor do I
have a privacy policy :)

I'm CJ Avilla, I work at App Academy and I would love it if you would
all stand up, please.

Repeat after me:

I: <state your username>
PAUSE
Password: <state your password>

click submit, and take a seat.

Welcome back username!

You may imagine that this application is a collaborative document
editor, maybe a game, but most likely its a Chat room. Given that many
of you are here to, as they say, "meet up" with one another.
Our application has included a feature to show who's currently online.

Lets quickly explore 4 alternatives to showing who's online.

Number 1! Using some sort of last seen date.

As we know trafic to our sites happens to come in waves. Lets say we
posted something on HN and we're getting a wave of traffic. this side of
the room is the early adopters :).

now everyone who recently raised their hand is considered online. now if
you want to seem like you're online you could continually raise your
hand, continually hit the page. but that's annoying.

Code!

;lastseen
[option 1](https://gist.github.com/w1zeman1p/17ae623444e9e85609e2)

The rest of our options all require some javascript and i've written a
couple of functions that we'll be able to reuse everywhere. Lets see
what those are.

;layofland
[layofland](https://gist.github.com/28cd0d4ea7d6bee377d7)

Option B... Keep an in memory cache of the relevent user data.

The idea here is that as users visit the page they will send an ajax
request in the background to register them as being online. then we'll
need some clever way of knowing when they've left.

In this example i'm going to attempt to cache who's logged in in my
memory. I've got a blind fold. I'm going to attempt to keep track of
who's online based on you saying favorite gem LOCKED AND LOADED favorite gem OVER AND OUT.
so for example: capybara LOCKED AND LOADED, faker LOCKED AND LOADED.

Code!

[option 2](https://gist.github.com/998aa864ba99d4ef866e)

3rd Option: Use websockets

Option 3 is really broken down into a few sub options:
  suboption 1: Third party (Pusher/Slanger)
  suboption 2: Roll your own websockets stuff (socket.io)
  suboption 3: Use rails websockets

  feedback

no working link to soundcloud
gist for pusher
repo for node stuff
likes the socks thing
who's online delay
only one problem with number2
*microservice*
funkyness with return value of window on close
