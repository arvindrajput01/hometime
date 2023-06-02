# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

* generating the resevation model in short we can use rails g
	rails generate model reservation reservation_code:string start_date:datetime end_date:datetime nights:integer guests:integer adults:integer children:integer infants:integer status:string currency:string payout_price:decimal security_price:decimal total_price:decimal localized_description:string guest_id: integer

* generating the guest model
	rails g model guest first_name:string last_name:string email:string phone_one:string phone_two:string
* run below commnad to create database if already not created
	bundle exec rake db:create

* run the migration script
 bundle exec rake db:migrate

* generate reservation controller
	rails generate controller Api::Reservaions --api
