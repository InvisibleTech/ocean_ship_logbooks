# OceanShipLogbooks
## Things Happened Getting Here
While this is a strange "Hello World" for Phoenix use, it is an interesting one.  The [tutorial was pretty good](https://wtfleming.github.io/2016/01/28/geospatial-app-elixir-postgis-phoenix/) but if you know one thing about software and new tehnologies - things change and tutorials break.  So at this moment in time here's the information that got me this far.

* PostGIS extensions

   When the original tutorial was written, enabling extensions was done as in the tutorial, but
   Ecto evolved and so using the '~>' lands you with an Ecto that needs you to do it a new way. You
   will want to read up on [Postgrex onfiguration](https://hexdocs.pm/postgrex/Postgrex.Types.html#define/3) and to
   bring it all home this related [post on the Elixir forum](https://elixirforum.com/t/where-to-call-postgrex-types-define-in-phoenix-ecto-project/4810)

* CSV processing

   Of course the GIS stuff is not your only problem.  In addition to those changes you really want to use
   the new *angry* version of the `decode` method known as `decode!` since it strips off the statuses that
   this newer version of the CSV processor slaps in front of every row if you don't use it.  Of course
   the `!` really means will raise exceptions - so you don't have to match on the :ok status.
   Do what you want - I think doing it this way keeps my code smaller.  I am lazy and less code is better.
   To learn more consult this [fine documentation for the CSV processor](https://hexdocs.pm/csv/CSV.html#decode!/2) and choose your own approach.

* The Data now seems to require you sign in or sign up - no biggie Kaggle is giving me data - if this freaks you out, get the data elsewhere I guess.  By the way, the step where you load all the data - is slowwwww (takes 10 minutes or more on my MacBook Air with a 2.2GHz i7, SSD, and 8GB) because it is using the CSV processor of the controller and sucking in each line from the CSV to insert one row at a time into the database. Oh yeah, the link in the original tutorial is not working to get the data [the data is here](https://www.kaggle.com/cwiloc/climate-data-from-ocean-ships/version/1).


## Normal Phoenix Stuff
To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
