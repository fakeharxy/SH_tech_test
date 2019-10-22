# Postcode Webtest

Technical Test using Ruby, Sinatra, RSpec, Capybara, HTTParty, Webmock, VCR, Mongo, Database Cleaner and Rake :) 

## Running the tests

I've set up a Rakefile so you should just be able to clone, ```bundle``` and ```rake```.

## Further improvements

The model for the Mongo database isn't tested, I simply ran out of time.

In general, the database could have been further extracted with a wrapper around it too. I'm also sure there is a better way to validate the DB inputs than the before_create hook I've put in there. In general I'm not sure why I used Mongo as I'd never used it before.

Also the error catching in app.rb doesn't feel great. 

There is obviously no styling AT ALL, as there is a styling challenge separately.

