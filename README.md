# OmniAuth GoToWebinar OAuth2

GoToWebinar OAuth2 Strategy for OmniAuth 1.0.

## Installing

Add to your `Gemfile`:

```ruby
gem 'omniauth-gotowebinar-oauth2'
```

Then `bundle install`.

Or install it yourself as:

    $ gem install omniauth-gotowebinar-oauth2

## Usage

`OmniAuth::Strategies::GoToWebinar` is simply a Rack middleware. Read the
OmniAuth 1.0 docs for detailed instructions:
https://github.com/intridea/omniauth.

Here's a quick example, adding the middleware to a Rails app in
`config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :go_to_webinar, ENV['GOTOWEBINAR_API_KEY'], ENV['GOTOWEBINAR_API_SECRET']
end
```

## Authentication Hash

Here's an example *Authentication Hash* available in
`request.env['omniauth.auth']`:

```ruby
{
  :provider => 'go_to_webinar',
  :uid => '1234567890',
  :info => {
    :nickname => 'beenhero',
    :name => 'beenhero',
    :location => '浙江 杭州',
    :image => 'http://tp4.sinaimg.cn/1640099215/50/1287016234/1',
    :description => '移步twitter@beenhero',
    :urls => {  :Blog => 'http://beenhero.com'
                :gotowebinar => 'http://gotowebinar.com/beenhero'
    },
  },
  :credentials => {
    :token => '2.00JjgzmBd7F...', # OAuth 2.0 access_token, which you
may wish to store
    :expires_at => 1331780640, # when the access token expires (if it
expires)
    :expires => true # if you request `offline_access` this will be
false
  },
  :extra => {
    :raw_info => {
      ... # data from /2/users/show.json, check by yourself
    }
  }
}
```

*PS.* This document was largely cribbed from 
http://github.com/beenhero/omniauth-weibo-oauth2

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

Copyright (c) 2013 by Graham Randall

Permission is hereby granted, free of charge, to any person obtaining a
copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
