Adtek.io Adnetworks
===

Dealing with Mobile Advertising Networks can be a non-trivial task, especially
when it comes to integrating them into reporting tools: each has their own
report APIs, each of which return their own report-data format.

On top of that, each has its own authentication methods, making it difficult
to obtain the right credentials for the right report. Where possible, this
gem provides scrapers for adnetworks to obtain API credentials in a transparent
and common manner.


Importers
---

- [Spends importers](/lib/adtekio_adnetworks/importers/cost) which retrieve
  spending reports from various networks.
- [Revenue importers](/lib/adtekio_adnetworks/importers/revenue) which
  retrieve revenue reports from various adnetworks.

API Key Scrapers
---

[API Key Scrapers](/lib/adtekio_adnetworks/api_key_scrapers) aim to obtain
the API credentials using the login details of the adnetwork. That is to
say, they automate the retrieval of API credentials from adnetworks
where possible.

So when an adnetwork says something like: ```To obtain your API key, first
login, then go to your profile page, then click API key ...``` etc, a
scraper will automagically do that to obtain the API credentials.

Integration
---

To include the gem in your project, add this to your favourite Gemfile:

```
gem 'adtekio_adnetworks', :github => "adtekio/adnetworks"
```

then run bundle and require the gem:

```
require 'adtekio_adnetworks'
```

Usage
---

You can play around with the gem by cloning it and then running a
[pry][pry] shell:

```
git clone git@github.com:adtekio/adnetworks.git
cd adnetworks
bundle
rake shell
```

Ideally your using either [rbenv][rbenv] or [rvm][rvm] to isolate your ruby
versions and gemsets.


License
---

Released under the GPLv2.

See https://www.gnu.org/licenses/gpl-2.0 for details.

Contributing to Gem
---

1. Fork it ( https://github.com/adtekio/adnetworks/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Make sure to add tests (`rake test`)
6. Please try not to mess with the Rakefile, version, or history
7. Create new Pull Request

[pry]: http://pryrepl.org/
[rbenv]: https://github.com/rbenv/rbenv
[rvm]: https://rvm.io/
