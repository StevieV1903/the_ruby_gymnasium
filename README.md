# The Gymnasium
The Gymnasium is a gym management Ruby application using the Sinatra web framework and a Postgres database. It allows the gym manager to track gym members, fitness sessions and gym bookings.
## Getting Started

These instructions should get you a copy of the project up and running on your local machine for development purposes.

```
createdb gymnasium
```

Run the seed file to populate the database:

```
ruby db/seeds.rb
```

Run the app:

```
ruby app.rb
```

In your browser, navigate to http://localhost:4567/ to open up the app's homepage. 

<img width="1130" alt="Screenshot 2020-01-07 at 08 31 38" src="https://user-images.githubusercontent.com/56826534/74717309-186a2380-5228-11ea-99fb-b36c3739298d.png">
