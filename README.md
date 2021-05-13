# Backend Deploying with Heroku

## How To Deploy

Make sure your backend project is in its own repo (separate from your frontend
project), and that it is connected to a repo on Github.

- [Create a Heroku account](https://signup.heroku.com/) and [download the Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli)
- Make sure you're using [postgresql instead of sqlite](https://devcenter.heroku.com/articles/sqlite3)
- [Tutorial](https://devcenter.heroku.com/articles/rack#pure-rack-apps)

## CORS

Once you've deployed your frontend, it's time to update your
CORS configuration!

```rb
# config/initializers/cors.rb
require "rack/cors"
require_relative "./config/environment.rb"

use Rack::Cors do
  allow do
    origins "frontend-domain.com"
    resource "*", headers: :any, methods: [:get, :post, :patch, :delete]
  end
end

run Application.new
```


## Common Issues

If you get an error about having the wrong Ruby version:

- Use RVM to install the version needed by Heroku:
  - `rvm install 2.6.6`
- Update the Ruby version at the top of your Gemfile:
  - ruby '2.6.6'
- Delete `Gemfile.lock` and update your gems:
  - `bundle install`
- commit your code and push the new version to Heroku
  - `git add .`
  - `git commit -m 'Update Ruby version'`
  - `git push heroku main`

## What Happens When I Deploy?

Glad you asked! Deploying your site involves taking the code that lives on your
machine, and setting it up to run on someone else's machine.

For our Rack applications, that means our Ruby code needs to run on someone
else's computer and be accessible to requests from anywhere on the internet
(instead of just from our local computer).

With Heroku, when we deploy an application, Heroku carves out a piece of memory
for our app to run on its servers. It creates a virtual environment in a Unix
container (in Heroku-speak, a `dyno`) that has all the required environment
setup to run our Rails applications.

When we upload our code to Heroku (by pushing up our git repo), Heroku will
build our application and set it up to run and listen for requests.

Heroku is configured to use **Continuous Deployment**, which typically works by
connecting your Git repository with Heroku. Then, any time you push up changes
to your main branch to our Heroku remote, your deployed site will automatically
update! This makes it very easy to add features even after you've deployed.
