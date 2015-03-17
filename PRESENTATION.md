Super stoked to see all of you and excited to welcome you to this
interactive demo of **presence**. This room is a simulated web
application. You are all potential users of the site, this foreword is a
landing page and to see the rest of the presentation you'll need to
authenticate. As you may have noticed this site is not HTTPS nor do I
have a privacy policy :)

I'm CJ Avilla, I work at App Academy and I would love it if you would
all stand up, please.

Repeat after me:

my username is: <state your username>
PAUSE
my password id: <state your password>

click submit, and take a seat.

Welcome back username!

Our application has included a feature to show who's currently online.
You may imagine that this application is a collaborative document
editor, maybe a game, but most likely its a Chat room. Given that many
of you are here to, as they say, "meet up" with one another.

Lets quickly explore 4 alternatives to showing who's online.

Lets first get a quick lay of the land.

Number 1! Using some sort of last seen date.

As we know trafic to our sites happens to come in waves. Lets say we posted something on HN and we're getting a wave of traffic. this side of the room is the early adopters :).

now everyone who recently raised their hand is considered online. now if you want to seem like you're online you could continually raise your hand, continually hit the page. but that's annoying.

Code!

[option 1](https://gist.github.com/w1zeman1p/17ae623444e9e85609e2)

Option B... Keep an in memory cache of the relevent user data.

Code!

[option 2]()

3rd Option: Use websockets

Option 3 is really broken down into a few sub options:
  suboption 1: Third party (Pusher/Slanger)
  suboption 2: Roll your own websockets stuff (socket.io)
  suboption 3: Use rails websockets
