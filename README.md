# Jungle
===========

## Project Overview
A mini e-commerce application built with Rails 4.2 that allows users to shop from different category and place orders. Admin users can add and delete products and categories.

## Github

Jaycob Duffel (https://github.com/JaycobDuffel)

## Screenshots

![Home Page](https://github.com/JaycobDuffel/jungle-rails/blob/master/public/docs/Homepage.png?raw=true)
![About Us](https://github.com/JaycobDuffel/jungle-rails/blob/master/public/docs/About%20Us.png?raw=true)
![Admin Product Page](https://github.com/JaycobDuffel/jungle-rails/blob/master/public/docs/admin_product_page.png?raw=true)


## Setup
 Fork this repository and clone your fork
 Run `bundle install` to install dependencies
 Create `config/database.yml` by copying `config/database.example.yml`
 Create `config/secrets.yml` by copying `config/secrets.example.yml`
 Run `bin/rake db:reset` to create, load and seed db
 Create .env file based on .env.example
 Sign up for a Stripe account
 Put Stripe (test) keys into appropriate .env vars
 Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
