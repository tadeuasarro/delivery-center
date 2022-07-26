# FDelivery Center Test

##### In this API I'm parsing a JSON file and verificating it with a third party service, then I submit the data into a database.

#### Features
- Parse the input;
- Validate the data with a third party service;
- Submit the data into a DB.

## Built With
- [Rails](https://rubyonrails.org/)

## Gems
- [PG](https://rubygems.org/gems/pg)
- [RSpec-rails](https://rubygems.org/gems/rspec-rails)
- [Rubocop](https://rubygems.org/gems/rubocop)
- [Shoulda-matchers](https://rubygems.org/gems/shoulda-matchers)

## Getting started

### Setup

Clone the repo with

```
  https://github.com/tadeuasarro/delivery-center.git
```

Then run

```
  bundle install
```

Start server with:

```
  rails server
```

### Run tests

```
  rspec
```

### Opportunities
- The main opportunity I see in this application is to better understand the business rules and requirements in order to create a better DB, regarding entities relationships and attributes/ columns.

- Eg.: I don't know the liberty I would have when creating the models, in my opinion Adress would be it's own model and belong to Customer, and Customer would have many Adresses, which I believe is quite standard in the industry.
- Eg 2.: The customer and the items are being created in the Order create route, but I understand that in a live e-commerce, for instance, these models would already have been created via other routes/ requests.
- Eg 3.: In the Payment model "type" is a inherited attribute/ column, making it sort of a safeword, so I just changed the name to paymentType in that case.