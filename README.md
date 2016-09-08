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

So that when an adnetwork says something like: ```To obtain your API key, first
login, then go to your profile page, then click API key ...``` etc, a
scraper will do that automagically and obtain the API credentials.
