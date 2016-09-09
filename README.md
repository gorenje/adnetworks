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

- [Spends importers][simp] which retrieve spending reports from
  various networks.
- [Revenue importers][rimp] which retrieve revenue reports from various
  adnetworks.

API Key Scrapers
---

[API Key Scrapers][apsc] aim to obtain the API credentials using the login
details of the adnetwork. That is to say, they automate the retrieval of
API credentials from adnetworks where possible.

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

Ideally you are using either [rbenv][rbenv] or [rvm][rvm] to isolate your ruby
versions and gemsets.

### Spends Importers

*Note:* 'Spends Importer' and 'Cost Importer' are used interchangeably but
represent the same thing: the money spent on marketing and user acquistion.

Each cost importer is registered with the `AdtekioAdnetworks::CostImport`
class, from there you can get a complete list of supported adnetworks:

```
pry> AdtekioAdnetworks::CostImport.networks
=> {:adcolony=>AdtekioAdnetworks::Cost::Adcolony,
 :adquant=>AdtekioAdnetworks::Cost::Adquant,
 :appia=>AdtekioAdnetworks::Cost::Appia,
 :applifier=>AdtekioAdnetworks::Cost::Applifier,
 :applift=>AdtekioAdnetworks::Cost::Applift,
 :applovin=>AdtekioAdnetworks::Cost::Applovin,
 :bidmotion=>AdtekioAdnetworks::Cost::Bidmotion, ....
```

This returns a hash with network-name/importer-class pairs of all
supported cost importers.

Each importer requires credentials to obtain the costs, to find out
what is required, you use the `required_credentials` class method:

```
pry> importer_klass = AdtekioAdnetworks::CostImport.networks[:adcolony]
=> AdtekioAdnetworks::Cost::Adcolony
pry> importer_klass.required_credentials
=> [:api_key]
```

In this example, adcolony requires an api_key. This can either be obtained
directly from adcolony or using [the corresponding api_scraper][adcapsc].

So having obtained the `api_key`, we can now use it by assigning the
credentials (using a hash instance):

```
pry> importer = importer_klass.new
=> #<AdtekioAdnetworks::Cost::Adcolony:0x007f822a051730>
pry> importer.credentials = { :api_key => "xxx" }
=> {:api_key=>"xxx"}
```

After that, to obtain the costs/spends for the last five days:

```
pry> importer.campaign_costs(Date.today-5, Date.today)
=> [{:date=>..., :campaign=>"xx", :adgroup=>"xx", :impressions=>..., :clicks=>..., :conversions=>..., :amount=>..., :target_country=>"..."},
...etc
```

The result is always an array of hashes. Hash can be different from importer
to importer, however they always include the `amount`, `date`, `campaign`,
and `clicks`.

This interface applies to all cost importers, they have the same interface but
different credentials.

### Revenue Importers

TODO.

### API Key Scrapers

Providing a unified method of obtaining API credentials. Since most adnetworks
do not use login details for their APIs, a user always has to obtain an
their API credentials from the adnetworks.

Since this can be a confusing task (since most adnetworks squirrel their
API credentials away somewhere non-intuitive) but using an API scraper,
this becomes as easy as providing username & password and pressing a
button!

All [supported adnetworks][libscp] all have the same interface:

```
pry> scraper = AdtekioAdnetworks::ApiKeyScrapers.new
pry> login_details = {"username" => "username used to login", "password" => "password used to login" }
pry> credentials = scraper.obtain_key_for("applift",login_details))
```

The `login_details` is always a hash with "username" and "password" as key.
Username is whatever the adnetworks requires to login, i.e it could be
an email or a username or a banana, whatever is required by the adnetwork.

`obtain_key_for` always returns a hash but what it contains is adnetwork
specific. However, for those adnetworks that return one value (i.e. an api
key or token), the hash always is for the form `{ :token => 'api key value' }`.

To get a list of all supported networks:

```
pry> AdtekioAdnetworks::ApiKeyScrapers.supporter_adnetworks
=> ["adcolony", "applift", "applovin", "chartboost", "crossinstall", "leadbolt", "loopme", "mdotm", "revmob", "tapjoy", "unilead", "vungle"]
```

### Postbacks

TODO.


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
[simp]: /lib/adtekio_adnetworks/importers/cost
[rimp]: /lib/adtekio_adnetworks/importers/revenue
[apsc]: /lib/adtekio_adnetworks/api_key_scrapers
[adcapsc]: /lib/adtekio_adnetworks/api_key_scrapers/adcolony.rb
[libscp]: /lib/adtekio_adnetworks/api_key_scrapers
