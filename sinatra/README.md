# sinatra

The `sinatra` component of `sinatra-and-ios` provides a web app with which the `ios` app communicates.

## Development

The project is set up to use `rbenv` and has a local `bundler` configuration. All gems are installed locally to `vendor/bundle`, and their cached versions at `vendor/bundle` are checked into source control.

`Procfile` describes ways to launch the webapp for `heroku`.

`config.ru` describes to `Rack` how to launch the app.

`api.rb` describes the routes for the server.

Helped in part by the following guides:
- https://devcenter.heroku.com/articles/getting-started-ios-development-sinatra-cedar
- https://mherman.org/blog/designing-with-class-sinatra-plus-postgresql-plus-heroku/